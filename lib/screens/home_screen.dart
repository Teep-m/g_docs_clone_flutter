import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:g_docs_clone_flutter/colors.dart';
import 'package:g_docs_clone_flutter/repository/auth_repository.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  void signOut(WidgetRef ref) {
    ref.read(authRepositoryProvider).signOut();
    ref.read(userProvider.notifier).update((state) => null);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.add,
              color: kCyanColor,
            ),
          ),
          IconButton(
            onPressed: () => signOut(ref),
            icon: const Icon(
              Icons.logout,
              color: kRedColor,
            ),
          ),
        ],
      ),
      body: Center(
        child: Text(
          ref.watch(userProvider)!.uid,
        ),
      ),
    );
  }
}
