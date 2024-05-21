import 'package:flutter/material.dart';
import 'package:my_assistant/cubit/chat_cubit.dart';
import 'package:my_assistant/gemini_view.dart';
import 'package:my_assistant/widgets/prompt_field.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  List<ChatCubit> chats = [];

  @override
  void initState() {
    chats = [
      ChatCubit(name: 'Ulelele'),
      ChatCubit(name: 'Heheh'),
      ChatCubit(name: 'ChatGPT'),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      print(constraints.maxWidth);
      return Scaffold(
        body: Column(
          children: [
            Expanded(
                child: constraints.maxWidth <= 500
                    ? _buildForMobile(context)
                    : Row(
                        children: [
                          ...chats.map((cubit) =>
                              Expanded(child: GeminiView(cubit: cubit)))
                        ],
                      )),
            PromptField(onSend: (input) {
              for (var cubit in chats) {
                cubit.generateContinuousAnswer(input);
              }
            })
          ],
        ),
      );
    });
  }

  Widget _buildForMobile(BuildContext context) {
    return DefaultTabController(
      length: chats.length,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: chats
                .map(
                  (cubit) => Tab(text: cubit.state.name),
                )
                .toList(),
          ),
        ),
        body: TabBarView(
          children: chats.map((cubit) => GeminiView(cubit: cubit)).toList(),
        ),
      ),
    );
  }
}
