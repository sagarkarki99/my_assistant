import 'package:flutter/material.dart';

class PromptField extends StatefulWidget {
  final Function(String) onSend;
  const PromptField({super.key, required this.onSend});

  @override
  State<PromptField> createState() => _PromptFieldState();
}

class _PromptFieldState extends State<PromptField> {
  late final TextEditingController inputController;
  @override
  void initState() {
    inputController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(
            maxWidth: 600,
          ),
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
                  onTapOutside: (_) => FocusScope.of(context).unfocus(),
                  onEditingComplete: () {
                    FocusScope.of(context).unfocus();
                    widget.onSend(inputController.text);
                    inputController.text = '';
                  },
                ),
              ),
              IconButton(
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  widget.onSend(inputController.text);
                  inputController.text = '';
                },
                icon: const Icon(Icons.arrow_forward_ios_sharp),
              )
            ],
          ),
        ),
      ),
    );
  }
}
