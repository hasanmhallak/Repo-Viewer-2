import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../infrastructure/auth_remote_service.dart';

class AuthPage extends StatefulWidget {
  final String initialUrl;
  final Function(Uri authorizedUrl) authorizedUrlHandler;
  const AuthPage({
    Key? key,
    required this.initialUrl,
    required this.authorizedUrlHandler,
  }) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return WebView(
      javascriptMode: JavascriptMode.unrestricted,
      initialUrl: widget.initialUrl,
      onWebViewCreated: (controller) {
        controller.clearCache();
        CookieManager().clearCookies();
      },
      navigationDelegate: (navigation) {
        if (navigation.url
            .startsWith(AuthRemoteService.redirectedUrl.toString())) {
          widget.authorizedUrlHandler(Uri.parse(navigation.url));
          return NavigationDecision.prevent;
        } else {
          return NavigationDecision.navigate;
        }
      },
    );
  }
}
