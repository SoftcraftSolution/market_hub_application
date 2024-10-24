import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class EconomicCalendarPage extends StatefulWidget {
  const EconomicCalendarPage({super.key});

  @override
  State<EconomicCalendarPage> createState() => _EconomicCalendarPageState();
}

class _EconomicCalendarPageState extends State<EconomicCalendarPage> {

  final controller=WebViewController()
  ..setJavaScriptMode(JavaScriptMode.disabled)
  ..loadRequest(Uri.parse("https://www.mql5.com/en/economic-calendar"));
  @override
  Widget build(BuildContext context) {
    return WebViewWidget(controller: controller);
  }
}
