// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'payment_state_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PaymentStateDTO _$PaymentStateDTOFromJson(Map<String, dynamic> json) {
  return _PaymentStateDTO.fromJson(json);
}

/// @nodoc
class _$PaymentStateDTOTearOff {
  const _$PaymentStateDTOTearOff();

  _PaymentStateDTO call(
      {required String id,
      String? bankStatus,
      String? cardStatus,
      required String statusGroup,
      required String confirmLink}) {
    return _PaymentStateDTO(
      id: id,
      bankStatus: bankStatus,
      cardStatus: cardStatus,
      statusGroup: statusGroup,
      confirmLink: confirmLink,
    );
  }

  PaymentStateDTO fromJson(Map<String, Object?> json) {
    return PaymentStateDTO.fromJson(json);
  }
}

/// @nodoc
const $PaymentStateDTO = _$PaymentStateDTOTearOff();

/// @nodoc
mixin _$PaymentStateDTO {
  String get id => throw _privateConstructorUsedError;
  String? get bankStatus => throw _privateConstructorUsedError;
  String? get cardStatus => throw _privateConstructorUsedError;
  String get statusGroup => throw _privateConstructorUsedError;
  String get confirmLink => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaymentStateDTOCopyWith<PaymentStateDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentStateDTOCopyWith<$Res> {
  factory $PaymentStateDTOCopyWith(
          PaymentStateDTO value, $Res Function(PaymentStateDTO) then) =
      _$PaymentStateDTOCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String? bankStatus,
      String? cardStatus,
      String statusGroup,
      String confirmLink});
}

/// @nodoc
class _$PaymentStateDTOCopyWithImpl<$Res>
    implements $PaymentStateDTOCopyWith<$Res> {
  _$PaymentStateDTOCopyWithImpl(this._value, this._then);

  final PaymentStateDTO _value;
  // ignore: unused_field
  final $Res Function(PaymentStateDTO) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? bankStatus = freezed,
    Object? cardStatus = freezed,
    Object? statusGroup = freezed,
    Object? confirmLink = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      bankStatus: bankStatus == freezed
          ? _value.bankStatus
          : bankStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      cardStatus: cardStatus == freezed
          ? _value.cardStatus
          : cardStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      statusGroup: statusGroup == freezed
          ? _value.statusGroup
          : statusGroup // ignore: cast_nullable_to_non_nullable
              as String,
      confirmLink: confirmLink == freezed
          ? _value.confirmLink
          : confirmLink // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$PaymentStateDTOCopyWith<$Res>
    implements $PaymentStateDTOCopyWith<$Res> {
  factory _$PaymentStateDTOCopyWith(
          _PaymentStateDTO value, $Res Function(_PaymentStateDTO) then) =
      __$PaymentStateDTOCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String? bankStatus,
      String? cardStatus,
      String statusGroup,
      String confirmLink});
}

/// @nodoc
class __$PaymentStateDTOCopyWithImpl<$Res>
    extends _$PaymentStateDTOCopyWithImpl<$Res>
    implements _$PaymentStateDTOCopyWith<$Res> {
  __$PaymentStateDTOCopyWithImpl(
      _PaymentStateDTO _value, $Res Function(_PaymentStateDTO) _then)
      : super(_value, (v) => _then(v as _PaymentStateDTO));

  @override
  _PaymentStateDTO get _value => super._value as _PaymentStateDTO;

  @override
  $Res call({
    Object? id = freezed,
    Object? bankStatus = freezed,
    Object? cardStatus = freezed,
    Object? statusGroup = freezed,
    Object? confirmLink = freezed,
  }) {
    return _then(_PaymentStateDTO(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      bankStatus: bankStatus == freezed
          ? _value.bankStatus
          : bankStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      cardStatus: cardStatus == freezed
          ? _value.cardStatus
          : cardStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      statusGroup: statusGroup == freezed
          ? _value.statusGroup
          : statusGroup // ignore: cast_nullable_to_non_nullable
              as String,
      confirmLink: confirmLink == freezed
          ? _value.confirmLink
          : confirmLink // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PaymentStateDTO extends _PaymentStateDTO {
  const _$_PaymentStateDTO(
      {required this.id,
      this.bankStatus,
      this.cardStatus,
      required this.statusGroup,
      required this.confirmLink})
      : super._();

  factory _$_PaymentStateDTO.fromJson(Map<String, dynamic> json) =>
      _$$_PaymentStateDTOFromJson(json);

  @override
  final String id;
  @override
  final String? bankStatus;
  @override
  final String? cardStatus;
  @override
  final String statusGroup;
  @override
  final String confirmLink;

  @override
  String toString() {
    return 'PaymentStateDTO(id: $id, bankStatus: $bankStatus, cardStatus: $cardStatus, statusGroup: $statusGroup, confirmLink: $confirmLink)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PaymentStateDTO &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.bankStatus, bankStatus) &&
            const DeepCollectionEquality()
                .equals(other.cardStatus, cardStatus) &&
            const DeepCollectionEquality()
                .equals(other.statusGroup, statusGroup) &&
            const DeepCollectionEquality()
                .equals(other.confirmLink, confirmLink));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(bankStatus),
      const DeepCollectionEquality().hash(cardStatus),
      const DeepCollectionEquality().hash(statusGroup),
      const DeepCollectionEquality().hash(confirmLink));

  @JsonKey(ignore: true)
  @override
  _$PaymentStateDTOCopyWith<_PaymentStateDTO> get copyWith =>
      __$PaymentStateDTOCopyWithImpl<_PaymentStateDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PaymentStateDTOToJson(this);
  }
}

abstract class _PaymentStateDTO extends PaymentStateDTO {
  const factory _PaymentStateDTO(
      {required String id,
      String? bankStatus,
      String? cardStatus,
      required String statusGroup,
      required String confirmLink}) = _$_PaymentStateDTO;
  const _PaymentStateDTO._() : super._();

  factory _PaymentStateDTO.fromJson(Map<String, dynamic> json) =
      _$_PaymentStateDTO.fromJson;

  @override
  String get id;
  @override
  String? get bankStatus;
  @override
  String? get cardStatus;
  @override
  String get statusGroup;
  @override
  String get confirmLink;
  @override
  @JsonKey(ignore: true)
  _$PaymentStateDTOCopyWith<_PaymentStateDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
