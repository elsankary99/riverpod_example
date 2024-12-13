import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:learn_riverpod/providers/message_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(messagesProvider);
    return Scaffold(
      body: provider.when(
        loading: () {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
        error: (error, _) {
          return Center(
            child: Text(error.toString()),
          );
        },
        data: (data) {
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              final message = data[index];
              return ListTile(
                leading: Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTYFd_vbnZZkRiTVc8MSA1zDZnEKBAYIyLiUw&s',
                  width: 30,
                  height: 30,
                ),
                title: Text(message.message ?? ""),
              );
            },
          );
        },
      ),
    );
  }
}
