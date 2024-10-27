import 'package:flutter/material.dart';
import 'package:market_hub_application/shared/components/loading_page/ui/loading_page.dart';
import 'package:webview_flutter/webview_flutter.dart';

class EconomicCalendarPage extends StatefulWidget {
  const EconomicCalendarPage({super.key});

  @override
  State<EconomicCalendarPage> createState() => _EconomicCalendarPageState();
}

class _EconomicCalendarPageState extends State<EconomicCalendarPage> {
  bool isLoading = true; // Track loading state
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (url) {
            _handlePageStart();
          },
          onPageFinished: (url) {
            _handlePageFinished();
          },
        ),
      )
      ..loadRequest(Uri.parse(
          "https://www.tradays.com/en/economic-calendar/widget?mode=2&amp;utm_source=www.tradays.com"));
  }

  void _handlePageStart() {
    if (mounted) {
      setState(() {
        isLoading = true; // Show loader when page starts loading
      });
    }
  }

  void _handlePageFinished() {
    if (mounted) {
      setState(() {
        isLoading = false; // Hide loader when page finishes loading
      });
    }
  }

  @override
  void dispose() {
    // No explicit dispose method for WebViewController, but you can clear state if needed.
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        children: [
          WebViewWidget(controller: controller), // The WebView content
          if (isLoading) // Display loader only while loading
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: LoadingPage(),
            )
        ],
      ),
    );
  }
}
