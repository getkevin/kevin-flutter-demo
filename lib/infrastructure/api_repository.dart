import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:kevin_demo_app/domain/creditor/creditor.dart';
import 'package:kevin_demo_app/domain/i_api_repository.dart';
import 'package:kevin_demo_app/domain/payment_state/payment_state.dart';
import 'package:kevin_demo_app/domain/repository_failure/repository_failure.dart';
import 'package:kevin_demo_app/infrastructure/creditor_dto/creditor_dto.dart';
import 'package:kevin_demo_app/infrastructure/payment_state_dto/payment_state_dto.dart';

@LazySingleton(as: IApiRepository)
class ApiRepository implements IApiRepository {
  final Dio _dio;

  final String kevinDemoBaseUrl = "https://api.getkevin.eu/demo";
  final String kevinMobileDemoBaseUrl = "https://mobile-demo.kevin.eu/api/v2/";

  ApiRepository(
    this._dio,
  );

  @override
  Future<Either<RepositoryFailure, List<String>>> getCountryList() async {
    try {
      final Response<dynamic> response = await _dio.get(
        "$kevinDemoBaseUrl/countries",
      );

      if (response.data != null) {
        final countryCodes = response.data["data"].map<String>((item) {
          return item as String;
        }).toList();
        return right(countryCodes);
      } else {
        return left(const RepositoryFailure.emptyResponse());
      }
    } catch (e) {
      return left(const RepositoryFailure.unexpected());
    }
  }

  @override
  Future<Either<RepositoryFailure, List<Creditor>>> getCreditors({
    required String forCountryCode,
  }) async {
    try {
      final countryCode = forCountryCode.toUpperCase() == "LT" ? "LT" : "EE";
      final Response<dynamic> response = await _dio.get(
        "$kevinDemoBaseUrl/creditors",
        queryParameters: {
          "countryCode": countryCode,
        },
      );

      if (response.data != null) {
        final responseList = response.data["data"] as List<dynamic>;

        final creditors = responseList.map((e) {
          return CreditorDTO.fromJson(e).toDomain();
        }).toList();

        return right(creditors);
      } else {
        return left(const RepositoryFailure.emptyResponse());
      }
    } catch (e) {
      return left(const RepositoryFailure.unexpected());
    }
  }

  @override
  Future<Either<RepositoryFailure, PaymentState>> initializeBankPayment({
    required String amount,
    required String email,
    required String iban,
  }) async {
    try {
      final Response<dynamic> response = await _dio.post(
        "$kevinMobileDemoBaseUrl/payments/bank/",
        data: {
          "amount": amount,
          "email": email,
          "iban": iban,
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
  Future<Either<RepositoryFailure, PaymentState>> initializeCardPayment({
    required String amount,
    required String email,
    required String iban,
  }) async {
    try {
      final Response<dynamic> response = await _dio.post(
        "$kevinMobileDemoBaseUrl/payments/card/",
        data: {
          "amount": amount,
          "email": email,
          "iban": iban,
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
