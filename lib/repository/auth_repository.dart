import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:g_docs_clone_flutter/models/user_model.dart';
import 'package:google_sign_in/google_sign_in.dart';

final authRepositoryProvider = Provider(
  (ref) => AuthRepository(
    googleSignIn: GoogleSignIn(),
  ),
);

class AuthRepository {
  final GoogleSignIn _googleSignIn;
  AuthRepository({
    required GoogleSignIn googleSignIn,
  }) : _googleSignIn = googleSignIn;

  void signInWithGoogle() async {
    try {
      final user = await _googleSignIn.signIn();
      if (user != null) {
        final userAcc = UserModel(email: user.email, name: name, profilePic: profilePic, uid: uid, token: token,)
      }
    } catch (e) {
      print(e);
    }
  }
}
