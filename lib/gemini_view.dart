import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:my_assistant/cubit/chat_cubit.dart';
import 'package:my_assistant/widgets/chat_items.dart';

class GeminiView extends StatefulWidget {
  const GeminiView({super.key, required this.cubit});

  final ChatCubit cubit;

  @override
  State<GeminiView> createState() => _GeminiViewState();
}

class _GeminiViewState extends State<GeminiView>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider.value(
      value: widget.cubit,
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: Text('${context.read<ChatCubit>().state.name} chat'),
            centerTitle: true,
          ),
          body: Center(
            child: LayoutBuilder(builder: (context, constraints) {
              final maxWidth = constraints.maxWidth > 700
                  ? 700.toDouble()
                  : constraints.maxWidth;
              return Container(
                height: constraints.maxHeight,
                color: Colors.blueGrey[50],
                constraints: BoxConstraints(maxWidth: maxWidth),
                child: BlocBuilder<ChatCubit, AiModelState>(
                  builder: (context, state) {
                    final chatsHistory = state.chats;
                    return Stack(
                      children: [
                        if (chatsHistory.isEmpty)
                          Center(
                            child: Text('Lets chat with ${state.name}'),
                          ),
                        AnimatedList(
                          key: state.chatListKey,
                          primary: true,
                          physics: const BouncingScrollPhysics(),
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
                                        name: 'U',
                                        value:
                                            chatsHistory[index].message ?? '',
                                        width: maxWidth * 0.7,
                                      )
                                    : index == chatsHistory.length - 1 &&
                                            state is Thinking
                                        ? ModelResponseUI(
                                            name: state.name,
                                            width: maxWidth * 0.7,
                                          )
                                        : ModelResponseUI(
                                            name: state.name,
                                            value: chatsHistory[index].message,
                                            width: maxWidth * 0.7,
                                          ),
                              ),
                            );
                          },
                        ),
                      ],
                    );
                  },
                ),
              );
            }),
          ),
        );
      }),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
