import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

import 'package:speech_to_text/speech_to_text.dart';

part 'ai_model_state.dart';
part 'ai_model_cubit.freezed.dart';

typedef VoiceAssistant = FlutterTts;

class AiModelCubit extends Cubit<AiModelState> {
  late final GenerativeModel _geminiModel;
  late final SpeechToText _speechToText;
  late final VoiceAssistant _assistant;

  AiModelCubit() : super(const AiModelState.initial()) {
    _setupModel();

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
      model: 'gemini-pro',
    );
    final contents = [
      Content.text(
          'Always answer me in less than 30 words and Do not give an answer in markdown format.')
    ];
    final response = await _geminiModel.generateContent(contents);
    log('Model: ${response.text}');
  }

  SpeechToText get speechToText => _speechToText;
  VoiceAssistant get voiceAssistant => _assistant;

  Future<void> generateAnswer(String input) async {
    if (input.trim().isEmpty) return;
    log('Prompt: $input');
    final content = [Content.text(input)];
    emit(const AiModelState.thinking());

    try {
      final response = await _geminiModel.generateContent(content);
      final outputText = response.text;
      log('Model: $outputText');
      emit(AiModelState.generatingAnswer(outputText ?? 'Failed to generate'));
      final status = await voiceAssistant
          .speak(response.text ?? 'There is nothing to speak');
      print('status: $status');
    } on GenerativeAIException catch (e) {
      emit(const AiModelState.generatingAnswer('I cannot answer that'));
    } finally {
      await _assistant.stop();
      emit(const AiModelState.initial());
    }
  }

  void generateContinuousAnswer(String input) {
    final content = [Content.text(input)];
    emit(const AiModelState.thinking());
    _geminiModel
        .generateContentStream(content)
        .listen((GenerateContentResponse event) {
      print(event.functionCalls);
      for (var candidate in event.candidates) {
        if (_hasModelStoppedAnswering(candidate)) {
          emit(const AiModelState.initial());
        }
      }
      print(event.text);
      emit(AiModelState.generatingAnswer(
        event.text ?? 'Failed to generate, hehe',
      ));
    });
  }

  bool _hasModelStoppedAnswering(Candidate candidate) {
    return candidate.content.role == 'model' &&
        candidate.finishReason == FinishReason.stop;
  }

  Future<void> stopSpeaking() async {
    await _assistant.stop();
    emit(const AiModelState.initial());
  }

  Future<void> _setupVoiceAssistant() async {
    _assistant = VoiceAssistant();
    await _assistant.awaitSpeakCompletion(true);
    await _assistant.setLanguage("en-US");

    await _assistant.setSpeechRate(0.5);

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
