// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_state_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PaymentStateDTO _$$_PaymentStateDTOFromJson(Map<String, dynamic> json) =>
    _$_PaymentStateDTO(
      id: json['id'] as String,
      bankStatus: json['bankStatus'] as String?,
      cardStatus: json['cardStatus'] as String?,
      statusGroup: json['statusGroup'] as String,
      confirmLink: json['confirmLink'] as String,
    );

Map<String, dynamic> _$$_PaymentStateDTOToJson(_$_PaymentStateDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'bankStatus': instance.bankStatus,
      'cardStatus': instance.cardStatus,
      'statusGroup': instance.statusGroup,
      'confirmLink': instance.confirmLink,
    };
