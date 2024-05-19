import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:google_generative_ai/google_generative_ai.dart';

import 'package:my_assistant/cubit/chat_cubit.dart';
import 'package:my_assistant/widgets/chat_items.dart';

class GeminiView extends StatefulWidget {
  const GeminiView({super.key});

  @override
  State<GeminiView> createState() => _GeminiViewState();
}

class _GeminiViewState extends State<GeminiView> {
  late final TextEditingController inputController;
  late final GenerativeModel myModel;
  List<ChatData> chats = [];

  late final GlobalKey<AnimatedListState> _listKey;
  late final ScrollController _scrollController;

  @override
  void initState() {
    inputController = TextEditingController();
    myModel = GenerativeModel(
      apiKey: geminiApiKey,
      model: 'gemini-1.5-flash-latest',
    );
    _listKey = GlobalKey<AnimatedListState>();
    _scrollController = ScrollController();
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
          final maxWidth = constraints.maxWidth > 600
              ? 600.toDouble()
              : constraints.maxWidth;
          return Center(
            child: Container(
              color: Colors.blueGrey[50],
              constraints: BoxConstraints(
                maxWidth: maxWidth,
              ),
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Stack(
                      children: [
                        if (chats.isEmpty)
                          const Center(
                            child: Text('Lets chat with Gemini'),
                          ),
                        AnimatedList(
                          key: _listKey,
                          reverse: true,
                          controller: _scrollController,
                          initialItemCount: chats.length,
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
                                child: chats[index].role == 'user'
                                    ? PromptUI(
                                        value: chats[index].message ?? '',
                                        width: maxWidth * 0.7,
                                      )
                                    : ModelResponseUI(
                                        value: chats[index].message,
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
                              sendPrompt();
                            },
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            FocusScope.of(context).unfocus();
                            sendPrompt();
                          },
                          icon: const Icon(Icons.arrow_forward_ios_sharp),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  void sendPrompt() async {
    final prompt = inputController.text.trim();
    inputController.text = '';
    setState(() {
      chats.insert(0, ChatData(message: prompt, role: 'user'));
      _listKey.currentState!.insertItem(0);
    });
    final content = [Content.text(prompt)];

    await Future.delayed(const Duration(milliseconds: 500));
    setState(() {
      chats.insert(
          0,
          ChatData(
            role: 'Model',
          ));
      _listKey.currentState!.insertItem(0);
    });

    myModel.generateContentStream(content).listen(
      (GenerateContentResponse data) {
        log(data.text ?? 'Nothing');
        log(data.promptFeedback.toString());
        setState(() {
          final oldData = chats.removeAt(0).message ?? '';
          final newResponse = data.text ?? '';
          chats.insert(
              0, ChatData(role: 'model', message: oldData + newResponse));
        });
      },
    );
  }
}

class ChatData {
  String role;
  String? message;
  ChatData({required this.role, this.message});
}
