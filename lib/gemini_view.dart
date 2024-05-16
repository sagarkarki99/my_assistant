import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:markdown_widget/widget/all.dart';
import 'package:my_assistant/main.dart';

class GeminiView extends StatefulWidget {
  const GeminiView({super.key});

  @override
  State<GeminiView> createState() => _GeminiViewState();
}

class _GeminiViewState extends State<GeminiView> {
  late final TextEditingController inputController;
  late final GenerativeModel myModel;
  List<Widget> chats = [];
  String displayText = '';

  @override
  void initState() {
    inputController = TextEditingController();
    myModel = GenerativeModel(
      apiKey: geminiApiKey,
      model: 'gemini-pro',
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          AppBar(
            title: const Text('Gemini'),
          ),
          Expanded(
            child: chats.isEmpty
                ? const Center(
                    child: Text('Lets chat with Gemini'),
                  )
                : ListView.builder(
                    itemCount: chats.length,
                    itemBuilder: (context, index) {
                      return chats[index];
                    },
                  ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: inputController,
                  decoration: const InputDecoration(
                    hintText: 'Ask me anything, hehehe...',
                  ),
                ),
              ),
              IconButton(
                onPressed: sendPrompt,
                icon: const Icon(Icons.arrow_forward_ios_sharp),
              )
            ],
          )
        ],
      ),
    );
  }

  void sendPrompt() async {
    final prompt = inputController.text.trim();
    inputController.text = '';
    setState(() {
      chats.add(Text(prompt));
    });
    final content = [Content.text(prompt)];
    final responses = await myModel.generateContent(content);
    setState(() {
      chats.add(Text(responses.text ?? 'Nothing'));
    });
    // myModel
    //     .generateContentStream(content)
    //     .listen((GenerateContentResponse event) {
    //   print(event.text);
    //   setState(() {
    //     displayText = event.text ?? 'Nothing';
    //   });
    // });
  }
}
