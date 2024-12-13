//! Future Provider
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_riverpod/models/messages_model.dart';
import 'package:learn_riverpod/services/message_service.dart';

final messagesProvider = FutureProvider<List<MessageModel>>((ref) async {
  final messageService = ref.read(messageServiceProvider);
  return await messageService.getMessages();
});
