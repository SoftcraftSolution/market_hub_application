package com.example.market_hub_application

import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import android.view.WindowManager.LayoutParams

class MainActivity: FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        // Add this line to prevent screenshots
        window.setFlags(LayoutParams.FLAG_SECURE, LayoutParams.FLAG_SECURE)
    }
}
