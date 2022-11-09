import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:g_docs_clone_flutter/constants.dart';
import 'package:g_docs_clone_flutter/models/user_model.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart';

final authRepositoryProvider = Provider(
  (ref) => AuthRepository(
    googleSignIn: GoogleSignIn(),
  ),
);

class AuthRepository {
  final GoogleSignIn _googleSignIn;
  final Client _client;
  AuthRepository({required GoogleSignIn googleSignIn, required Client client})
      : _googleSignIn = googleSignIn,
        _client = client;

  void signInWithGoogle() async {
    try {
      final user = await _googleSignIn.signIn();
      if (user != null) {
        final userAcc = UserModel(
          email: user.email,
          name: user.displayName!,
          profilePic: user.photoUrl!,
          uid: '',
          token: '',
        );

        var res = await _client.post(Uri.parse('$host/api/signup'),
            body: userAcc.toJson(),
            headers: {
              'Content-Type': 'application/json; charset=utf-8',
            });

        switch (res.statusCode) {
          case 200:
            final newUser = userAcc.copyWith(
              uid: jsonDecode(res.body)['user'] ,
            );
        }
      }
    } catch (e) {
      print(e);
    }
  }
}
