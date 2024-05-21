// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AiModelState {
  String get name => throw _privateConstructorUsedError;
  GlobalKey<AnimatedListState>? get chatListKey =>
      throw _privateConstructorUsedError;
  List<ChatData> get chats => throw _privateConstructorUsedError;
  AiResponseStatus get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AiModelStateCopyWith<AiModelState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AiModelStateCopyWith<$Res> {
  factory $AiModelStateCopyWith(
          AiModelState value, $Res Function(AiModelState) then) =
      _$AiModelStateCopyWithImpl<$Res, AiModelState>;
  @useResult
  $Res call(
      {String name,
      GlobalKey<AnimatedListState>? chatListKey,
      List<ChatData> chats,
      AiResponseStatus status});

  $AiResponseStatusCopyWith<$Res> get status;
}

/// @nodoc
class _$AiModelStateCopyWithImpl<$Res, $Val extends AiModelState>
    implements $AiModelStateCopyWith<$Res> {
  _$AiModelStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? chatListKey = freezed,
    Object? chats = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      chatListKey: freezed == chatListKey
          ? _value.chatListKey
          : chatListKey // ignore: cast_nullable_to_non_nullable
              as GlobalKey<AnimatedListState>?,
      chats: null == chats
          ? _value.chats
          : chats // ignore: cast_nullable_to_non_nullable
              as List<ChatData>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AiResponseStatus,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AiResponseStatusCopyWith<$Res> get status {
    return $AiResponseStatusCopyWith<$Res>(_value.status, (value) {
      return _then(_value.copyWith(status: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AiModelStateImplCopyWith<$Res>
    implements $AiModelStateCopyWith<$Res> {
  factory _$$AiModelStateImplCopyWith(
          _$AiModelStateImpl value, $Res Function(_$AiModelStateImpl) then) =
      __$$AiModelStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      GlobalKey<AnimatedListState>? chatListKey,
      List<ChatData> chats,
      AiResponseStatus status});

  @override
  $AiResponseStatusCopyWith<$Res> get status;
}

/// @nodoc
class __$$AiModelStateImplCopyWithImpl<$Res>
    extends _$AiModelStateCopyWithImpl<$Res, _$AiModelStateImpl>
    implements _$$AiModelStateImplCopyWith<$Res> {
  __$$AiModelStateImplCopyWithImpl(
      _$AiModelStateImpl _value, $Res Function(_$AiModelStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? chatListKey = freezed,
    Object? chats = null,
    Object? status = null,
  }) {
    return _then(_$AiModelStateImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      chatListKey: freezed == chatListKey
          ? _value.chatListKey
          : chatListKey // ignore: cast_nullable_to_non_nullable
              as GlobalKey<AnimatedListState>?,
      chats: null == chats
          ? _value._chats
          : chats // ignore: cast_nullable_to_non_nullable
              as List<ChatData>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AiResponseStatus,
    ));
  }
}

/// @nodoc

class _$AiModelStateImpl implements _AiModelState {
  const _$AiModelStateImpl(
      {required this.name,
      this.chatListKey,
      final List<ChatData> chats = const [],
      this.status = const AiResponseStatus.initial()})
      : _chats = chats;

  @override
  final String name;
  @override
  final GlobalKey<AnimatedListState>? chatListKey;
  final List<ChatData> _chats;
  @override
  @JsonKey()
  List<ChatData> get chats {
    if (_chats is EqualUnmodifiableListView) return _chats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_chats);
  }

  @override
  @JsonKey()
  final AiResponseStatus status;

  @override
  String toString() {
    return 'AiModelState(name: $name, chatListKey: $chatListKey, chats: $chats, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AiModelStateImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.chatListKey, chatListKey) ||
                other.chatListKey == chatListKey) &&
            const DeepCollectionEquality().equals(other._chats, _chats) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, chatListKey,
      const DeepCollectionEquality().hash(_chats), status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AiModelStateImplCopyWith<_$AiModelStateImpl> get copyWith =>
      __$$AiModelStateImplCopyWithImpl<_$AiModelStateImpl>(this, _$identity);
}

abstract class _AiModelState implements AiModelState {
  const factory _AiModelState(
      {required final String name,
      final GlobalKey<AnimatedListState>? chatListKey,
      final List<ChatData> chats,
      final AiResponseStatus status}) = _$AiModelStateImpl;

  @override
  String get name;
  @override
  GlobalKey<AnimatedListState>? get chatListKey;
  @override
  List<ChatData> get chats;
  @override
  AiResponseStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$AiModelStateImplCopyWith<_$AiModelStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AiResponseStatus {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String? thinkingMessage) thinking,
    required TResult Function(String answer) generatingAnswer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String? thinkingMessage)? thinking,
    TResult? Function(String answer)? generatingAnswer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String? thinkingMessage)? thinking,
    TResult Function(String answer)? generatingAnswer,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(Thinking value) thinking,
    required TResult Function(GeneratingAnswer value) generatingAnswer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Thinking value)? thinking,
    TResult? Function(GeneratingAnswer value)? generatingAnswer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Thinking value)? thinking,
    TResult Function(GeneratingAnswer value)? generatingAnswer,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AiResponseStatusCopyWith<$Res> {
  factory $AiResponseStatusCopyWith(
          AiResponseStatus value, $Res Function(AiResponseStatus) then) =
      _$AiResponseStatusCopyWithImpl<$Res, AiResponseStatus>;
}

/// @nodoc
class _$AiResponseStatusCopyWithImpl<$Res, $Val extends AiResponseStatus>
    implements $AiResponseStatusCopyWith<$Res> {
  _$AiResponseStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$AiResponseStatusCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'AiResponseStatus.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String? thinkingMessage) thinking,
    required TResult Function(String answer) generatingAnswer,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String? thinkingMessage)? thinking,
    TResult? Function(String answer)? generatingAnswer,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String? thinkingMessage)? thinking,
    TResult Function(String answer)? generatingAnswer,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(Thinking value) thinking,
    required TResult Function(GeneratingAnswer value) generatingAnswer,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Thinking value)? thinking,
    TResult? Function(GeneratingAnswer value)? generatingAnswer,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Thinking value)? thinking,
    TResult Function(GeneratingAnswer value)? generatingAnswer,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements AiResponseStatus {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$ThinkingImplCopyWith<$Res> {
  factory _$$ThinkingImplCopyWith(
          _$ThinkingImpl value, $Res Function(_$ThinkingImpl) then) =
      __$$ThinkingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? thinkingMessage});
}

/// @nodoc
class __$$ThinkingImplCopyWithImpl<$Res>
    extends _$AiResponseStatusCopyWithImpl<$Res, _$ThinkingImpl>
    implements _$$ThinkingImplCopyWith<$Res> {
  __$$ThinkingImplCopyWithImpl(
      _$ThinkingImpl _value, $Res Function(_$ThinkingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? thinkingMessage = freezed,
  }) {
    return _then(_$ThinkingImpl(
      thinkingMessage: freezed == thinkingMessage
          ? _value.thinkingMessage
          : thinkingMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ThinkingImpl implements Thinking {
  const _$ThinkingImpl({this.thinkingMessage});

  @override
  final String? thinkingMessage;

  @override
  String toString() {
    return 'AiResponseStatus.thinking(thinkingMessage: $thinkingMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ThinkingImpl &&
            (identical(other.thinkingMessage, thinkingMessage) ||
                other.thinkingMessage == thinkingMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, thinkingMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ThinkingImplCopyWith<_$ThinkingImpl> get copyWith =>
      __$$ThinkingImplCopyWithImpl<_$ThinkingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String? thinkingMessage) thinking,
    required TResult Function(String answer) generatingAnswer,
  }) {
    return thinking(thinkingMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String? thinkingMessage)? thinking,
    TResult? Function(String answer)? generatingAnswer,
  }) {
    return thinking?.call(thinkingMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String? thinkingMessage)? thinking,
    TResult Function(String answer)? generatingAnswer,
    required TResult orElse(),
  }) {
    if (thinking != null) {
      return thinking(thinkingMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(Thinking value) thinking,
    required TResult Function(GeneratingAnswer value) generatingAnswer,
  }) {
    return thinking(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Thinking value)? thinking,
    TResult? Function(GeneratingAnswer value)? generatingAnswer,
  }) {
    return thinking?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Thinking value)? thinking,
    TResult Function(GeneratingAnswer value)? generatingAnswer,
    required TResult orElse(),
  }) {
    if (thinking != null) {
      return thinking(this);
    }
    return orElse();
  }
}

abstract class Thinking implements AiResponseStatus {
  const factory Thinking({final String? thinkingMessage}) = _$ThinkingImpl;

  String? get thinkingMessage;
  @JsonKey(ignore: true)
  _$$ThinkingImplCopyWith<_$ThinkingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GeneratingAnswerImplCopyWith<$Res> {
  factory _$$GeneratingAnswerImplCopyWith(_$GeneratingAnswerImpl value,
          $Res Function(_$GeneratingAnswerImpl) then) =
      __$$GeneratingAnswerImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String answer});
}

/// @nodoc
class __$$GeneratingAnswerImplCopyWithImpl<$Res>
    extends _$AiResponseStatusCopyWithImpl<$Res, _$GeneratingAnswerImpl>
    implements _$$GeneratingAnswerImplCopyWith<$Res> {
  __$$GeneratingAnswerImplCopyWithImpl(_$GeneratingAnswerImpl _value,
      $Res Function(_$GeneratingAnswerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? answer = null,
  }) {
    return _then(_$GeneratingAnswerImpl(
      null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GeneratingAnswerImpl implements GeneratingAnswer {
  const _$GeneratingAnswerImpl(this.answer);

  @override
  final String answer;

  @override
  String toString() {
    return 'AiResponseStatus.generatingAnswer(answer: $answer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GeneratingAnswerImpl &&
            (identical(other.answer, answer) || other.answer == answer));
  }

  @override
  int get hashCode => Object.hash(runtimeType, answer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GeneratingAnswerImplCopyWith<_$GeneratingAnswerImpl> get copyWith =>
      __$$GeneratingAnswerImplCopyWithImpl<_$GeneratingAnswerImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String? thinkingMessage) thinking,
    required TResult Function(String answer) generatingAnswer,
  }) {
    return generatingAnswer(answer);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String? thinkingMessage)? thinking,
    TResult? Function(String answer)? generatingAnswer,
  }) {
    return generatingAnswer?.call(answer);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String? thinkingMessage)? thinking,
    TResult Function(String answer)? generatingAnswer,
    required TResult orElse(),
  }) {
    if (generatingAnswer != null) {
      return generatingAnswer(answer);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(Thinking value) thinking,
    required TResult Function(GeneratingAnswer value) generatingAnswer,
  }) {
    return generatingAnswer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Thinking value)? thinking,
    TResult? Function(GeneratingAnswer value)? generatingAnswer,
  }) {
    return generatingAnswer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Thinking value)? thinking,
    TResult Function(GeneratingAnswer value)? generatingAnswer,
    required TResult orElse(),
  }) {
    if (generatingAnswer != null) {
      return generatingAnswer(this);
    }
    return orElse();
  }
}

abstract class GeneratingAnswer implements AiResponseStatus {
  const factory GeneratingAnswer(final String answer) = _$GeneratingAnswerImpl;

  String get answer;
  @JsonKey(ignore: true)
  _$$GeneratingAnswerImplCopyWith<_$GeneratingAnswerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
