//! Future Provider
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_riverpod/models/messages_model.dart';
import 'package:learn_riverpod/services/message_service.dart';

final messagesProvider = FutureProvider<List<MessageModel>>((ref) async {
  final messageService = ref.read(messageServiceProvider);
  return await messageService.getMessages();
});

abstract class MessageState {}

class MessageInitial extends MessageState {}

class MessageLoading extends MessageState {}

class MessageError extends MessageState {
  final String error;

  MessageError({required this.error});
}

class MessageSuccess extends MessageState {
  final List<MessageModel> messageList;

  MessageSuccess({required this.messageList});
}

//!===سكرتيرررر===
final messageNotifierProvider =
    StateNotifierProvider<MessageNotifier, MessageState>((ref) {
  //* بنبعته من هنا
  final messageService = ref.read(messageServiceProvider);
  return MessageNotifier(messageService);
});
//!======

class MessageNotifier extends StateNotifier<MessageState> {
  //* استقباااال
  final MessageService messageService;
  MessageNotifier(this.messageService) : super(MessageInitial());

  Future<void> getMessages() async {
    state = MessageLoading(); //== // emit(MessageLoading());
    try {
      final messageList = await messageService.getMessages();
      state = MessageSuccess(messageList: messageList);
    } on Exception catch (e) {
      state = MessageError(error: e.toString());
    }
  }
}
