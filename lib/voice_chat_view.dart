import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_assistant/cubit/ai_model_cubit.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:animated_background/animated_background.dart';

class VoiceChatView extends StatefulWidget {
  const VoiceChatView({super.key});

  @override
  State<VoiceChatView> createState() => _VoiceChatViewState();
}

class _VoiceChatViewState extends State<VoiceChatView>
    with SingleTickerProviderStateMixin {
  bool _isListening = false;
  String _lastWords = '';
  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<AiModelCubit>();
    final voiceAssistant = cubit.speechToText;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () => context.read<AiModelCubit>().stopSpeaking(),
              child: const Icon(Icons.ac_unit_sharp, size: 100),
            ),
            cubit.state.maybeWhen(
              generatingAnswer: (answer) =>
                  LoadingAnimationWidget.staggeredDotsWave(
                color: Colors.pinkAccent,
                size: 200,
              ),
              thinking: (thinkingMessage) {
                return LoadingAnimationWidget.horizontalRotatingDots(
                  color: Colors.blueAccent,
                  size: 200,
                );
              },
              initial: () {
                return LoadingAnimationWidget.waveDots(
                  color: Colors.blueAccent,
                  size: 200,
                );
              },
              orElse: () => const SizedBox(),
            ),
            GestureDetector(
              onLongPressDown: (detail) {
                print('Pressing started');
                setState(() {
                  _isListening = true;
                });
                voiceAssistant.listen(
                  onResult: (result) {
                    setState(() {
                      _lastWords = result.recognizedWords;
                    });
                  },
                );
              },
              onLongPressEnd: (detail) async {
                setState(() {
                  _isListening = false;
                });
                voiceAssistant.stop();
                await Future.delayed(const Duration(milliseconds: 500));
                context.read<AiModelCubit>().generateAnswer(_lastWords);
              },
              child: AnimatedContainer(
                height: _isListening ? 130 : 100,
                width: _isListening ? 130 : 100,
                duration: const Duration(milliseconds: 300),
                child: Icon(
                  Icons.mic,
                  color: _isListening ? Colors.blueAccent : Colors.redAccent,
                  size: _isListening ? 130 : 100,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
