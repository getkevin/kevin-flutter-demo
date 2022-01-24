import 'package:dartz/dartz.dart';

import 'package:kevin_demo_app/domain/repository_failure/repository_failure.dart';

//------------------------------------------------------------------------------

abstract class IKevinRepository {
  Future<Either<RepositoryFailure, String>> startAccountLinking();
  Future<Either<RepositoryFailure, String>> startBankPayment();
  Future<Either<RepositoryFailure, String>> startCardPayment();
}
