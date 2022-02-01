import 'package:freezed_annotation/freezed_annotation.dart';

part 'creditor.freezed.dart';

@freezed
class Creditor with _$Creditor {
  const Creditor._();

  const factory Creditor({
    required String id,
    required String name,
    required String iban,
    required String logo,
    required String informationUnstructured,
    required String country,
    required String website,
    required String phone,
    required String email,
    required String address,
  }) = _Creditor;
}
