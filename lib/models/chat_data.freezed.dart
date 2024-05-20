// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ChatData {
  String get role => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChatDataCopyWith<ChatData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatDataCopyWith<$Res> {
  factory $ChatDataCopyWith(ChatData value, $Res Function(ChatData) then) =
      _$ChatDataCopyWithImpl<$Res, ChatData>;
  @useResult
  $Res call({String role, String? message});
}

/// @nodoc
class _$ChatDataCopyWithImpl<$Res, $Val extends ChatData>
    implements $ChatDataCopyWith<$Res> {
  _$ChatDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? role = null,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatDataImplCopyWith<$Res>
    implements $ChatDataCopyWith<$Res> {
  factory _$$ChatDataImplCopyWith(
          _$ChatDataImpl value, $Res Function(_$ChatDataImpl) then) =
      __$$ChatDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String role, String? message});
}

/// @nodoc
class __$$ChatDataImplCopyWithImpl<$Res>
    extends _$ChatDataCopyWithImpl<$Res, _$ChatDataImpl>
    implements _$$ChatDataImplCopyWith<$Res> {
  __$$ChatDataImplCopyWithImpl(
      _$ChatDataImpl _value, $Res Function(_$ChatDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? role = null,
    Object? message = freezed,
  }) {
    return _then(_$ChatDataImpl(
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ChatDataImpl implements _ChatData {
  _$ChatDataImpl({required this.role, this.message});

  @override
  final String role;
  @override
  final String? message;

  @override
  String toString() {
    return 'ChatData(role: $role, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatDataImpl &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, role, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatDataImplCopyWith<_$ChatDataImpl> get copyWith =>
      __$$ChatDataImplCopyWithImpl<_$ChatDataImpl>(this, _$identity);
}

abstract class _ChatData implements ChatData {
  factory _ChatData({required final String role, final String? message}) =
      _$ChatDataImpl;

  @override
  String get role;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$ChatDataImplCopyWith<_$ChatDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
