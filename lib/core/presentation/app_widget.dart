import 'package:flutter/material.dart';
import '../../auth/presentation/sign_in_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Repo Viewer',
      home: SignInPage(),
    );
  }
}