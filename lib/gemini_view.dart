import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:google_generative_ai/google_generative_ai.dart';

import 'package:my_assistant/cubit/chat_cubit.dart';
import 'package:my_assistant/models/chat_data.dart';
import 'package:my_assistant/widgets/chat_items.dart';

class GeminiView extends StatefulWidget {
  const GeminiView({super.key});

  @override
  State<GeminiView> createState() => _GeminiViewState();
}

class _GeminiViewState extends State<GeminiView> {
  late final TextEditingController inputController;

  @override
  void initState() {
    inputController = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Ulelele chat'),
        ),
        body: LayoutBuilder(builder: (context, constraints) {
          final chatCubit = context.read<ChatCubit>();

          final maxWidth = constraints.maxWidth > 600
              ? 600.toDouble()
              : constraints.maxWidth;
          return Center(
            child: Container(
              color: Colors.blueGrey[50],
              constraints: BoxConstraints(
                maxWidth: maxWidth,
              ),
              child: BlocBuilder<ChatCubit, AiModelState>(
                builder: (context, state) {
                  final chatsHistory = state.chats;
                  print('Count: ${chatsHistory.length}');
                  return Column(
                    children: <Widget>[
                      Expanded(
                        child: Stack(
                          children: [
                            if (chatsHistory.isEmpty)
                              const Center(
                                child: Text('Lets chat with Gemini'),
                              ),
                            AnimatedList(
                              key: state.chatListKey,
                              reverse: true,
                              initialItemCount: chatsHistory.length,
                              shrinkWrap: true,
                              padding: const EdgeInsets.all(8.0),
                              itemBuilder: (ctx, index, animation) {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 4),
                                  child: SlideTransition(
                                    position: animation.drive(
                                      Tween<Offset>(
                                        begin: const Offset(0, 1),
                                        end: const Offset(0, 0),
                                      ),
                                    ),
                                    child: chatsHistory[index].role == 'user'
                                        ? PromptUI(
                                            value:
                                                chatsHistory[index].message ??
                                                    '',
                                            width: maxWidth * 0.7,
                                          )
                                        : index == chatsHistory.length - 1 &&
                                                state is Thinking
                                            ? ModelResponseUI(
                                                width: maxWidth * 0.7,
                                              )
                                            : ModelResponseUI(
                                                value:
                                                    chatsHistory[index].message,
                                                width: maxWidth * 0.7,
                                              ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: inputController,
                                minLines: 1,
                                decoration: const InputDecoration(
                                  hintText: 'Ask me anything, hehehe...',
                                  border: OutlineInputBorder(),
                                ),
                                keyboardType: TextInputType.text,
                                onTapOutside: (_) =>
                                    FocusScope.of(context).unfocus(),
                                onEditingComplete: () {
                                  FocusScope.of(context).unfocus();
                                  chatCubit.generateContinuousAnswer(
                                      inputController.text);
                                  inputController.text = '';
                                },
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                FocusScope.of(context).unfocus();
                                chatCubit.generateContinuousAnswer(
                                    inputController.text);
                                inputController.text = '';
                              },
                              icon: const Icon(Icons.arrow_forward_ios_sharp),
                            )
                          ],
                        ),
                      )
                    ],
                  );
                },
              ),
            ),
          );
        }),
      ),
    );
  }
}
