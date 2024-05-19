part of 'chat_cubit.dart';

@freezed
class AiModelState with _$AiModelState {
  const factory AiModelState.initial() = _Initial;
  const factory AiModelState.thinking({String? thinkingMessage}) = Thinking;
  const factory AiModelState.generatingAnswer(String answer) = GeneratingAnswer;
}
