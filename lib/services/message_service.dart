import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_riverpod/models/messages_model.dart';
import 'package:learn_riverpod/providers/providers.dart';

final messageServiceProvider = Provider<MessageService>((ref) {
  final dio = ref.read(dioProvider);
  return MessageService(dio: dio);
});

//!======
class MessageService {
  final Dio dio;
  MessageService({required this.dio});

  Future<List<MessageModel>> getMessages() async {
    final response = await dio.get('messages');
    final data = response.data as List;

    final messagesList = data
        .map((e) => MessageModel.fromJson(e as Map<String, dynamic>))
        .toList();

    return messagesList;
  }
}
