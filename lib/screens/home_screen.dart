import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:g_docs_clone_flutter/colors.dart';
import 'package:g_docs_clone_flutter/repository/auth_repository.dart';
import 'package:g_docs_clone_flutter/repository/document_repository.dart';
import 'package:routemaster/routemaster.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  void signOut(WidgetRef ref) {
    ref.read(authRepositoryProvider).signOut();
    ref.read(userProvider.notifier).update((state) => null);
  }

  void createDocument(BuildContext context, WidgetRef ref) async {
    String token = ref.read(userProvider)!.token;
    final navigator = Routemaster.of(context);
    final snackbar = ScaffoldMessenger.of(context);

    final errorModel =
        await ref.read(documentRepositoryProvider).createDocument(token);

    if (errorModel.data != null) {
      navigator.push('/document/${errorModel.data.id}');
    } else {
      snackbar.showSnackBar(
        SnackBar(
          content: Text(errorModel.error!),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () => createDocument(context, ref),
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
      body: FutureBuilder(
        future: ref.watch(documentRepositoryProvider).getDocuments(
              ref.watch(userProvider)!.token,
            ),
        builder: ((context, snapshot) {
              
            }),
      ),
    );
  }
}
