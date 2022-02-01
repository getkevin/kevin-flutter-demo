import 'package:dartz/dartz.dart';
import 'package:kevin_demo_app/domain/creditor/creditor.dart';
import 'package:kevin_demo_app/domain/payment_state/payment_state.dart';
import 'package:kevin_demo_app/domain/repository_failure/repository_failure.dart';

abstract class IApiRepository {
  Future<Either<RepositoryFailure, List<String>>> getCountryList();
  Future<Either<RepositoryFailure, List<Creditor>>> getCreditors({
    required String forCountryCode,
  });
  Future<Either<RepositoryFailure, PaymentState>> initializeBankPayment({
    required String amount,
    required String email,
    required String iban,
  });
  Future<Either<RepositoryFailure, PaymentState>> initializeCardPayment({
    required String amount,
    required String email,
    required String iban,
  });
}
