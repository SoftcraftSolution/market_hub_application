import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/constants/color_constant.dart';
import '../../../core/utils/utils.dart';
import '../model/news_feed_model.dart';

class NewsBriefScreen extends StatelessWidget {
  final NewsFeedModel news;

  NewsBriefScreen({required this.news});

  Future<void> downloadAndOpenPDF(String url) async {
    // Request storage permission
;
    if (await Permission.storage.request().isGranted) {
      Directory appDocDir = await getApplicationDocumentsDirectory();
      String filePath = '${appDocDir.path}/${url.split('/').last}';

      // Check if the file already exists
      if (await File(filePath).exists()) {
        await openFile(filePath);
      } else {
        try {
          await Dio().download(url, filePath);
          await openFile(filePath);
        } catch (e) {
          print("Download failed: $e");
        }
      }
    } else {
      print("Permission denied");
    }
  }

  Future<void> openFile(String path) async {
    if (await canLaunch(path)) {
      await launch(path);
    } else {
      throw 'Could not open file at $path';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.backgroundColor,
      appBar: AppBar(
        backgroundColor: ColorConstants.backgroundColor,
        title: Text(
          "News Detail",
          style: GoogleFonts.poppins(fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              news.title,
              style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              diffFormatDate(news.date),
              style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 16),
            Center(
              child: Image.network(
                news.image,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Center(child: Text("Image not available")),
                  );
                },
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: Text(
                news.content,
                style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w400),
              ),
            ),
            if (news.pdfUrl != null && news.pdfUrl!.isNotEmpty) ...[
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => downloadAndOpenPDF(news.pdfUrl!),
                child: Text("Download and Open PDF"),
              ),
            ],
          ],
        ),
      ),
    );
  }
  void requestStoragePermission() async {
    var status = await Permission.storage.request();

    if (status.isGranted) {
      // Permission granted, proceed with the operation
    } else if (status.isDenied) {
      // Permission denied by the user, handle it
    } else if (status.isPermanentlyDenied) {
      // User has permanently denied the permission
      openAppSettings();  // This will take the user to the app settings
    }
  }
}
