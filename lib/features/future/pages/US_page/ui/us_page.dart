import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class UsPage extends StatefulWidget {
  const UsPage({super.key});

  @override
  State<UsPage> createState() => _UsPageState();
}

class _UsPageState extends State<UsPage> {
  final controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.disabled)
    ..loadRequest(Uri.parse("https://in.investing.com/commodities"));

  @override
  Widget build(BuildContext context) {
    return WebViewWidget(controller: controller);
  }
}
