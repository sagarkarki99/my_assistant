import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:my_assistant/gemini_view.dart';
import 'package:my_assistant/models/chat_data.dart';

import 'package:speech_to_text/speech_to_text.dart';

part 'chat_state.dart';
part 'chat_cubit.freezed.dart';

typedef VoiceAssistant = FlutterTts;

class ChatCubit extends Cubit<AiModelState> {
  late final GenerativeModel _geminiModel;
  late final SpeechToText _speechToText;
  late final VoiceAssistant _assistant;
  late final GlobalKey<AnimatedListState> _chatListKey;

  ChatCubit()
      : super(
          AiModelState(chatListKey: GlobalKey<AnimatedListState>()),
        ) {
    _setupModel();
    _chatListKey = GlobalKey<AnimatedListState>();
    _speechToText = SpeechToText();
    _speechToText.initialize(
      onStatus: (status) {
        print('Speech to text status: $status');
      },
      onError: (error) {
        print('Speech to text error: $error');
      },
    );
    _setupVoiceAssistant();
  }

  void _setupModel() async {
    _geminiModel = GenerativeModel(
      apiKey: geminiApiKey,
      model: 'gemini-1.5-flash-latest',
    );
    final contents = [
      Content.text(
          'Act like an assistant and respond in a natural and conversational way.')
    ];

    final response = await _geminiModel.generateContent(contents);
    log('Model: ${response.text}');
  }

  SpeechToText get speechToText => _speechToText;
  VoiceAssistant get voiceAssistant => _assistant;
  GlobalKey<AnimatedListState> get chatListKey => _chatListKey;

  Future<void> generateAnswer(String input) async {
    if (input.trim().isEmpty) return;
    log('Prompt: $input');
    final content = [Content.text(input)];
    emit(state.copyWith(status: const AiResponseStatus.thinking()));
    try {
      final response = await _geminiModel.generateContent(content);
      final outputText = response.text;
      log('Model: $outputText');
      emit(
        state.copyWith(
          status: AiResponseStatus.generatingAnswer(
            outputText ?? 'Failed to generate',
          ),
        ),
      );
      final status = await voiceAssistant
          .speak(response.text ?? 'There is nothing to speak');
      print('status: $status');
    } on GenerativeAIException catch (e) {
      emit(state.copyWith(
          status:
              const AiResponseStatus.generatingAnswer('I cannot answer that')));
    } finally {
      await _assistant.stop();
      emit(state.copyWith(status: const AiResponseStatus.initial()));
    }
  }

  Future<void> generateContinuousAnswer(String input) async {
    final content = [Content.text(input)];
    final newHistory = _insertIntoChatList(
      ChatData(role: 'user', message: input),
    );
    emit(
      state.copyWith(
        chats: newHistory,
      ),
    );
    await Future.delayed(const Duration(milliseconds: 600));
    emit(
      state.copyWith(
        status: const AiResponseStatus.thinking(),
        chats: _insertIntoChatList(
          ChatData(role: 'model'),
        ),
      ),
    );
    _geminiModel
        .generateContentStream(content)
        .listen((GenerateContentResponse event) {
      final lastMessage = state.chats.first.message ?? '';
      final newMessage = event.text ?? '';

      emit(
        state.copyWith(
          chats: List.of(state.chats)
            ..removeAt(0)
            ..insert(
                0,
                ChatData(
                  role: 'model',
                  message: lastMessage + newMessage,
                )),
          status: AiResponseStatus.generatingAnswer(
            event.text ?? 'Failed to generate',
          ),
        ),
      );
    });
  }

  List<ChatData> _insertIntoChatList(ChatData chatData) {
    state.chatListKey!.currentState!.insertItem(0);
    return List.of(state.chats)..insert(0, chatData);
  }

  bool _hasModelStoppedAnswering(Candidate candidate) {
    return candidate.content.role == 'model' &&
        candidate.finishReason == FinishReason.stop;
  }

  Future<void> stopSpeaking() async {
    await _assistant.stop();
    emit(state.copyWith(status: const AiResponseStatus.initial()));
  }

  Future<void> _setupVoiceAssistant() async {
    _assistant = VoiceAssistant();
    await _assistant.awaitSpeakCompletion(true);
    await _assistant.setLanguage("en-US");

    await _assistant.setSpeechRate(0.55);

    await _assistant.setVolume(1.0);

    await _assistant.setPitch(1.0);

    await _assistant.isLanguageAvailable("en-US");
    await _assistant.setIosAudioCategory(
        IosTextToSpeechAudioCategory.playback,
        [
          IosTextToSpeechAudioCategoryOptions.allowBluetooth,
          IosTextToSpeechAudioCategoryOptions.allowBluetoothA2DP,
          IosTextToSpeechAudioCategoryOptions.mixWithOthers
        ],
        IosTextToSpeechAudioMode.voicePrompt);
  }
}

const String geminiApiKey = 'AIzaSyByrLER-DHTtUXBctt4lb7sR-ZmuvzrMEM';
const String geminiApiKeyBassam = 'AIzaSyDv685V2cH4fqwDQamlMn0KOfPvRQTdDq0';
