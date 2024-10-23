// lib/views/home_update_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:market_hub_application/core/constants/color_constant.dart';
import 'package:market_hub_application/shared/components/loading_page/ui/loading_page.dart';
import '../controller/home_page_con.dart';
import '../model/home_updates_model.dart';
import 'full_screen_img.dart';
import 'package:intl/intl.dart'; // Import for date formatting

class HomeUpdatePage extends StatelessWidget {
  final HomeUpdateController controller = Get.put(HomeUpdateController());

  String formatDate(DateTime date) {
    // Format the date to a more readable format
    return DateFormat('yyyy-MM-dd – kk:mm').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: ColorConstants.backgroundColor, // Background color for the page
      body: Obx(() {
        if (controller.homeUpdates.value.isEmpty) {
          return Center(child: LoadingPage(cardSize: 250,));
        }
        return ListView.builder(
          itemCount: controller.homeUpdates.length,
          itemBuilder: (context, index) {
            HomeUpdate update = controller.homeUpdates[index];
            return Container(
              margin: EdgeInsets.all(10), // Margin around the card
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16), // Rounded corners
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, 4), // Shadow effect
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(15), // Padding inside the card
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      update.text,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87, // Better contrast
                      ),
                    ),
                    SizedBox(height: 10),
                    if (update.image != null) ...[
                      GestureDetector(
                        onTap: () => Get.to(FullScreenImage(imageUrl: update.image!)),
                        child: Hero(
                          tag: update.image!,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12), // Rounded image corners
                            child: Image.network(
                              update.image!,
                              height: 200,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                    Row(
                      children: [
                        Icon(Icons.access_time, color: Colors.grey[600]), // Icon for date
                        SizedBox(width: 5), // Space between icon and text
                        Text(
                          '${formatDate(update.createdAt)}', // Formatted date
                          style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
