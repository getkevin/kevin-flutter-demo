// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'payment_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PaymentStateTearOff {
  const _$PaymentStateTearOff();

  _PaymentState call(
      {required String id,
      String? bankStatus,
      String? cardStatus,
      required String statusGroup,
      required String confirmLink}) {
    return _PaymentState(
      id: id,
      bankStatus: bankStatus,
      cardStatus: cardStatus,
      statusGroup: statusGroup,
      confirmLink: confirmLink,
    );
  }
}

/// @nodoc
const $PaymentState = _$PaymentStateTearOff();

/// @nodoc
mixin _$PaymentState {
  String get id => throw _privateConstructorUsedError;
  String? get bankStatus => throw _privateConstructorUsedError;
  String? get cardStatus => throw _privateConstructorUsedError;
  String get statusGroup => throw _privateConstructorUsedError;
  String get confirmLink => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PaymentStateCopyWith<PaymentState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentStateCopyWith<$Res> {
  factory $PaymentStateCopyWith(
          PaymentState value, $Res Function(PaymentState) then) =
      _$PaymentStateCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String? bankStatus,
      String? cardStatus,
      String statusGroup,
      String confirmLink});
}

/// @nodoc
class _$PaymentStateCopyWithImpl<$Res> implements $PaymentStateCopyWith<$Res> {
  _$PaymentStateCopyWithImpl(this._value, this._then);

  final PaymentState _value;
  // ignore: unused_field
  final $Res Function(PaymentState) _then;

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
abstract class _$PaymentStateCopyWith<$Res>
    implements $PaymentStateCopyWith<$Res> {
  factory _$PaymentStateCopyWith(
          _PaymentState value, $Res Function(_PaymentState) then) =
      __$PaymentStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String? bankStatus,
      String? cardStatus,
      String statusGroup,
      String confirmLink});
}

/// @nodoc
class __$PaymentStateCopyWithImpl<$Res> extends _$PaymentStateCopyWithImpl<$Res>
    implements _$PaymentStateCopyWith<$Res> {
  __$PaymentStateCopyWithImpl(
      _PaymentState _value, $Res Function(_PaymentState) _then)
      : super(_value, (v) => _then(v as _PaymentState));

  @override
  _PaymentState get _value => super._value as _PaymentState;

  @override
  $Res call({
    Object? id = freezed,
    Object? bankStatus = freezed,
    Object? cardStatus = freezed,
    Object? statusGroup = freezed,
    Object? confirmLink = freezed,
  }) {
    return _then(_PaymentState(
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

class _$_PaymentState extends _PaymentState {
  const _$_PaymentState(
      {required this.id,
      this.bankStatus,
      this.cardStatus,
      required this.statusGroup,
      required this.confirmLink})
      : super._();

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
    return 'PaymentState(id: $id, bankStatus: $bankStatus, cardStatus: $cardStatus, statusGroup: $statusGroup, confirmLink: $confirmLink)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PaymentState &&
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
  _$PaymentStateCopyWith<_PaymentState> get copyWith =>
      __$PaymentStateCopyWithImpl<_PaymentState>(this, _$identity);
}

abstract class _PaymentState extends PaymentState {
  const factory _PaymentState(
      {required String id,
      String? bankStatus,
      String? cardStatus,
      required String statusGroup,
      required String confirmLink}) = _$_PaymentState;
  const _PaymentState._() : super._();

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
  _$PaymentStateCopyWith<_PaymentState> get copyWith =>
      throw _privateConstructorUsedError;
}
