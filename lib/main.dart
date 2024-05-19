import 'package:flutter/material.dart';
import 'package:my_assistant/cubit/chat_cubit.dart';
import 'package:my_assistant/gemini_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_assistant/voice_chat_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const VoiceChatView(),
      ),
    );
  }
}
