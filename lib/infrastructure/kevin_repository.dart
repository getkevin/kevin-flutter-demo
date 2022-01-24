import 'package:flutter/services.dart';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:kevin_demo_app/domain/auth_state/auth_state.dart';
import 'package:kevin_demo_app/domain/i_api_repository.dart';
import 'package:kevin_demo_app/domain/i_kevin_repository.dart';
import 'package:kevin_demo_app/domain/payment_state/payment_state.dart';
import 'package:kevin_demo_app/domain/repository_failure/repository_failure.dart';

//------------------------------------------------------------------------------

@LazySingleton(as: IKevinRepository)
class KevinRepository implements IKevinRepository {
  final IApiRepository _apiRepository;

  KevinRepository(
    this._apiRepository,
  );

  static const MethodChannel _channel = MethodChannel(
    "eu.kevin.kevin_demo_app/sdkChannel",
  );

  @override
  Future<Either<RepositoryFailure, String>> startAccountLinking() async {
    final state = await _apiRepository.getAuthState();

    return await state.fold(
      (error) {
        return left(error);
      },
      (AuthState _authState) async {
        final args = {
          "state": _authState.state,
        };

        final result = await _channel.invokeMethod(
          "OpenKevinAccountLinking",
          args,
        );

        if (result["isSuccess"]) {
          return right(result["authorizationCode"]);
        } else {
          return left(RepositoryFailure.sdkError(result["error"]));
        }
      },
    );
  }

  @override
  Future<Either<RepositoryFailure, String>> startBankPayment() async {
    final state = await _apiRepository.initializeBankPayment("0.01");

    return await state.fold(
      (error) {
        return left(error);
      },
      (PaymentState _paymentState) async {
        final args = {
          "id": _paymentState.id,
        };

        final result = await _channel.invokeMethod(
          "OpenKevinBankPayment",
          args,
        );

        if (result["isSuccess"]) {
          return right(result["paymentId"]);
        } else {
          return left(RepositoryFailure.sdkError(result["error"]));
        }
      },
    );
  }

  @override
  Future<Either<RepositoryFailure, String>> startCardPayment() async {
    final state = await _apiRepository.initializeCardPayment("0.01");

    return await state.fold(
      (error) {
        return left(error);
      },
      (PaymentState _paymentState) async {
        final args = {
          "id": _paymentState.id,
        };

        final result = await _channel.invokeMethod(
          "OpenKevinCardPayment",
          args,
        );

        if (result["isSuccess"]) {
          return right(result["paymentId"]);
        } else {
          return left(RepositoryFailure.sdkError(result["error"]));
        }
      },
    );
  }
}
