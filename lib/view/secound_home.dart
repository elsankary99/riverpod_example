import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:learn_riverpod/providers/message_provider.dart';

class SecondHome extends ConsumerStatefulWidget {
  const SecondHome({super.key});

  @override
  ConsumerState<SecondHome> createState() => _SecondHomeState();
}

class _SecondHomeState extends ConsumerState<SecondHome> {
  @override
  void initState() {
    Future.microtask(triger);
    super.initState();
  }

  Future<void> triger() async {
    await ref.read(messageNotifierProvider.notifier).getMessages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Consumer(
      builder: (context, ref, child) {
        final state = ref.watch(messageNotifierProvider);

        if (state is MessageError) {
          return Center(
            child: Text(state.error),
          );
        }
        if (state is MessageSuccess) {
          final data = state.messageList;
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
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    ));
  }
}
