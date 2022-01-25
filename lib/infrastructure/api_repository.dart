import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:kevin_demo_app/domain/auth_state/auth_state.dart';
import 'package:kevin_demo_app/domain/payment_state/payment_state.dart';
import 'package:kevin_demo_app/domain/i_api_repository.dart';
import 'package:kevin_demo_app/domain/repository_failure/repository_failure.dart';
import 'package:kevin_demo_app/infrastructure/auth_state_dto/auth_state_dto.dart';
import 'package:kevin_demo_app/infrastructure/payment_state_dto/payment_state_dto.dart';

@LazySingleton(as: IApiRepository)
class ApiRepository implements IApiRepository {
  final Dio _dio;

  final String baseUrl = "https://your.kevin.url/";

  ApiRepository(
    this._dio,
  );

  @override
  Future<Either<RepositoryFailure, AuthState>> getAuthState() async {
    try {
      final Response<dynamic> response = await _dio.post(
        "$baseUrl/auth/initiate/",
        data: {
          "scopes": ["payments"],
        },
      );

      if (response.data != null) {
        final authState =
            AuthStateDTO.fromJson(response.data as Map<String, dynamic>)
                .toDomain();

        return right(authState);
      } else {
        return left(const RepositoryFailure.emptyResponse());
      }
    } catch (e) {
      return left(const RepositoryFailure.unexpected());
    }
  }

  @override
  Future<Either<RepositoryFailure, PaymentState>> initializeBankPayment(
    String amount,
  ) async {
    try {
      final Response<dynamic> response = await _dio.post(
        "$baseUrl/payments/bank/",
        data: {
          "amount": amount,
        },
      );

      if (response.data != null) {
        final paymentState =
            PaymentStateDTO.fromJson(response.data as Map<String, dynamic>)
                .toDomain();

        return right(paymentState);
      } else {
        return left(const RepositoryFailure.emptyResponse());
      }
    } catch (e) {
      return left(const RepositoryFailure.unexpected());
    }
  }

  @override
  Future<Either<RepositoryFailure, PaymentState>> initializeCardPayment(
    String amount,
  ) async {
    try {
      final Response<dynamic> response = await _dio.post(
        "$baseUrl/payments/card/",
        data: {
          "amount": amount,
        },
      );

      if (response.data != null) {
        final paymentState =
            PaymentStateDTO.fromJson(response.data as Map<String, dynamic>)
                .toDomain();

        return right(paymentState);
      } else {
        return left(const RepositoryFailure.emptyResponse());
      }
    } catch (e) {
      return left(const RepositoryFailure.unexpected());
    }
  }
}
