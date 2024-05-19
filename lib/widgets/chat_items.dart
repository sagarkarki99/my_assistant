import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class PromptUI extends StatelessWidget {
  const PromptUI({super.key, required this.value, required this.width});

  final String value;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          constraints: BoxConstraints(maxWidth: width),
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Colors.blueGrey,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Text(value, style: Theme.of(context).textTheme.bodyMedium),
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
  final String? value;
  final double width;
  const ModelResponseUI({
    super.key,
    this.value,
    required this.width,
  });

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
        value == null
            ? SizedBox(
                height: 40,
                child: Center(
                  child: LoadingAnimationWidget.waveDots(
                    color: Colors.blueAccent,
                    size: 32,
                  ),
                ),
              )
            : Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.blueGrey[300],
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: SizedBox(
                  width: width * 0.9,
                  child: Markdown(
                    data: value!,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                  ),
                ),
              ),
      ],
    );
  }
}
