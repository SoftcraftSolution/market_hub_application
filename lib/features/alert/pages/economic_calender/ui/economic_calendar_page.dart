import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class EconomicCalendarPage extends StatefulWidget {
  const EconomicCalendarPage({super.key});

  @override
  State<EconomicCalendarPage> createState() => _EconomicCalendarPageState();
}

class _EconomicCalendarPageState extends State<EconomicCalendarPage> {

  final controller=WebViewController()
  ..setJavaScriptMode(JavaScriptMode.unrestricted)
  ..loadRequest(Uri.parse("https://www.tradays.com/en/economic-calendar/widget?mode=2&amp;utm_source=www.tradays.com"));
  @override
  Widget build(BuildContext context) {
    return WebViewWidget(controller: controller);
  }
}
