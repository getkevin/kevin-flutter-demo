import 'package:dartz/dartz.dart';

import 'package:kevin_demo_app/domain/auth_state/auth_state.dart';
import 'package:kevin_demo_app/domain/payment_state/payment_state.dart';
import 'package:kevin_demo_app/domain/repository_failure/repository_failure.dart';

//------------------------------------------------------------------------------

abstract class IApiRepository {
  Future<Either<RepositoryFailure, AuthState>> getAuthState();
  Future<Either<RepositoryFailure, PaymentState>> initializeBankPayment(
    String amount,
  );
  Future<Either<RepositoryFailure, PaymentState>> initializeCardPayment(
    String amount,
  );
}
