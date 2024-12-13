import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio(
    BaseOptions(baseUrl: 'https://647449b37de100807b1a9428.mockapi.io/api/v1/'),
  );
  return dio;
});

// final messagesProvider = FutureProvider<List<MessageModel>>((ref) async {
//   final messageService = ref.read(messageServiceProvider);
//   return await messageService.getMessages();
// });