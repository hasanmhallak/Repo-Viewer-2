import 'package:flutter/material.dart';

import '../../auth/presentation/sign_in_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Repo Viewer',
      darkTheme: ThemeData.dark(),
      home: const SignInPage(),
    );
  }
}
