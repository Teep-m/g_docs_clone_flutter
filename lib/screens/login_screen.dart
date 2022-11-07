import 'package:flutter/material.dart';
import 'package:g_docs_clone_flutter/colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton.icon(
          onPressed: () {},
          icon: Image.asset(
            'assets/images/g-logo-2.png',
            height: 20,
          ),
          label: const Text(
            'Sign in with Google',
            style: TextStyle(
              color: kCoralColor,
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: kAmberColor,
            minimumSize: const Size(150, 50),
          ),
        ),
      ),
    );
  }
}
