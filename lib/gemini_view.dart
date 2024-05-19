import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:markdown_widget/markdown_widget.dart';
import 'package:markdown_widget/widget/all.dart';
import 'package:my_assistant/cubit/chat_cubit.dart';

class GeminiView extends StatefulWidget {
  const GeminiView({super.key});

  @override
  State<GeminiView> createState() => _GeminiViewState();
}

class _GeminiViewState extends State<GeminiView> {
  late final TextEditingController inputController;
  late final GenerativeModel myModel;
  List<Widget> chats = [];

  late final GlobalKey<AnimatedListState> _listKey;
  late final ScrollController _scrollController;

  @override
  void initState() {
    inputController = TextEditingController();
    myModel = GenerativeModel(
      apiKey: geminiApiKey,
      model: 'gemini-pro',
    );
    _listKey = GlobalKey<AnimatedListState>();
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            AppBar(
              title: const Text('Gemini chat'),
            ),
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
                    itemBuilder: (ctx, index, animation) {
                      return SlideTransition(
                          position: animation.drive(
                            Tween<Offset>(
                              begin: const Offset(0, 1),
                              end: const Offset(0, 0),
                            ),
                          ),
                          child: chats[index]);
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
                      onTapOutside: (e) {
                        FocusScope.of(context).unfocus();
                      },
                      onEditingComplete: () {
                        FocusScope.of(context).unfocus();
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
  }

  void sendPrompt() async {
    final prompt = inputController.text.trim();
    inputController.text = '';
    setState(() {
      chats.insert(0, PromptUI(value: prompt));
      _listKey.currentState!.insertItem(0);
      setState(() {});
    });
    final content = [Content.text(prompt)];
    final response = await myModel.generateContent(content);
    _listKey.currentState!.insertItem(0);
    chats.insert(0, ModelResponseUI(value: response.text ?? 'Nothing'));
    // _scrollController.animateTo(
    //   _scrollController.position.maxScrollExtent,
    //   duration: const Duration(milliseconds: 500),
    //   curve: Curves.fastOutSlowIn,
    // );
    // myModel.generateContentStream(content).listen(
    //   (GenerateContentResponse data) {
    //     log(data.text ?? 'Nothing');
    //     setState(() {
    //       if (chats.first is! ModelResponseUI) {
    //         _listKey.currentState!.insertItem(0);
    //         chats.insert(0, ModelResponseUI(value: data.text ?? 'Nothing'));
    //         _scrollController.animateTo(
    //           _scrollController.position.maxScrollExtent,
    //           duration: const Duration(seconds: 2),
    //           curve: Curves.fastOutSlowIn,
    //         );
    //       } else {
    //         final previousData = chats.removeLast() as ModelResponseUI;
    //         final newValue = previousData.value + (data.text ?? '');
    //         chats.insert(0, ModelResponseUI(value: newValue));
    //         _scrollController.animateTo(
    //           _scrollController.position.maxScrollExtent,
    //           duration: const Duration(seconds: 2),
    //           curve: Curves.fastOutSlowIn,
    //         );
    //       }
    //     });
    //   },
    // );
  }
}

class PromptUI extends StatelessWidget {
  const PromptUI({super.key, required this.value});

  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.7,
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Colors.blueGrey,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Text(value),
        ),
        const SizedBox(width: 8),
        const CircleAvatar(
          radius: 20,
          backgroundColor: Colors.blueGrey,
          child: Text('Y'),
        ),
      ],
    );
  }
}

class ModelResponseUI extends StatelessWidget {
  final String value;
  const ModelResponseUI({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const CircleAvatar(
          radius: 20,
          backgroundColor: Colors.blueGrey,
          child: Text('M'),
        ),
        const SizedBox(width: 8),
        Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Colors.blueGrey,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: MarkdownWidget(
              data: value,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
            ),
          ),
        ),
      ],
    );
  }
}
