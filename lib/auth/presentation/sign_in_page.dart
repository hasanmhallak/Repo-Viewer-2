import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SvgPicture.asset(
              '/gitlab_icon.svg',
              width: 150,
              height: 150,
            ),
            const SizedBox(height: 3),
            Text(
              'Welcome to\nRepo Viewer',
              style: Theme.of(context).textTheme.headline3,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.orange[900],
              ),
              onPressed: () {
                //TODO: implement signin.
              },
              child: const Text('Signin'),
            ),
          ],
        ),
      ),
    );
  }
}
