part of 'chat_cubit.dart';

@freezed
class AiModelState with _$AiModelState {
  const factory AiModelState({
    required String name,
    GlobalKey<AnimatedListState>? chatListKey,
    @Default([]) List<ChatData> chats,
    @Default(AiResponseStatus.initial()) AiResponseStatus status,
  }) = _AiModelState;
}

@freezed
class AiResponseStatus with _$AiResponseStatus {
  const factory AiResponseStatus.initial() = _Initial;
  const factory AiResponseStatus.thinking({String? thinkingMessage}) = Thinking;
  const factory AiResponseStatus.generatingAnswer(String answer) =
      GeneratingAnswer;
}
