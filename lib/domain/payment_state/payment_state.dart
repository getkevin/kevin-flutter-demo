import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_state.freezed.dart';

@freezed
class PaymentState with _$PaymentState {
  const PaymentState._();

  const factory PaymentState({
    required String id,
    String? bankStatus,
    String? cardStatus,
    required String statusGroup,
    required String confirmLink,
  }) = _PaymentState;
}
