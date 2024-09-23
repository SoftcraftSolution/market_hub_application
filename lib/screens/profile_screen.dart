import 'package:flutter/material.dart';
import 'package:market_hub_application/utility/theme.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(backgroundColor: AppTheme.backgroundColor,
        // Customize the app bar

      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            topSection()
          ],
        ),
      ),
    );
  }
  Widget topSection()
  {
    return SizedBox(
      child: Align(
        alignment: Alignment.center,
        child: Container(
          height: 300,
          width: 300,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.grey.withOpacity(0.7)),
          child: SizedBox(),
        ),
      ),
    );
  }
}