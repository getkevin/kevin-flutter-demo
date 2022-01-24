import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:kevin_demo_app/domain/payment_state/payment_state.dart';

part 'payment_state_dto.freezed.dart';
part 'payment_state_dto.g.dart';

//------------------------------------------------------------------------------

@freezed
class PaymentStateDTO with _$PaymentStateDTO {
  const PaymentStateDTO._();

  const factory PaymentStateDTO({
    required String id,
    String? bankStatus,
    String? cardStatus,
    required String statusGroup,
    required String confirmLink,
  }) = _PaymentStateDTO;

  factory PaymentStateDTO.fromDomain(PaymentState paymentState) {
    return PaymentStateDTO(
      id: paymentState.id,
      bankStatus: paymentState.bankStatus,
      cardStatus: paymentState.cardStatus,
      statusGroup: paymentState.statusGroup,
      confirmLink: paymentState.confirmLink,
    );
  }

  PaymentState toDomain() {
    return PaymentState(
      id: id,
      bankStatus: bankStatus,
      cardStatus: cardStatus,
      statusGroup: statusGroup,
      confirmLink: confirmLink,
    );
  }

  factory PaymentStateDTO.fromJson(Map<String, dynamic> json) =>
      _$PaymentStateDTOFromJson(json);
}
