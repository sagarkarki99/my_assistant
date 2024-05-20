import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_data.freezed.dart';

@freezed
class ChatData with _$ChatData {
  factory ChatData({
    required String role,
    String? message,
  }) = _ChatData;
}
