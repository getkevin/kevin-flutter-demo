import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kevin_demo_app/domain/creditor/creditor.dart';

part 'creditor_dto.freezed.dart';
part 'creditor_dto.g.dart';

@freezed
class CreditorDTO with _$CreditorDTO {
  const CreditorDTO._();

  const factory CreditorDTO({
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
  }) = _CreditorDTO;

  factory CreditorDTO.fromDomain(Creditor creditor) {
    return CreditorDTO(
      id: creditor.id,
      name: creditor.name,
      iban: creditor.iban,
      logo: creditor.logo,
      informationUnstructured: creditor.informationUnstructured,
      country: creditor.country,
      website: creditor.website,
      phone: creditor.phone,
      email: creditor.email,
      address: creditor.address,
    );
  }

  Creditor toDomain() {
    return Creditor(
      id: id,
      name: name,
      iban: iban,
      logo: logo,
      informationUnstructured: informationUnstructured,
      country: country,
      website: website,
      phone: phone,
      email: email,
      address: address,
    );
  }

  factory CreditorDTO.fromJson(Map<String, dynamic> json) =>
      _$CreditorDTOFromJson(json);
}
