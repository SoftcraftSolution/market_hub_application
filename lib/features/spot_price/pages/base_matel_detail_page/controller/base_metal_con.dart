import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/constants/color_constant.dart';
import '../../../../../core/utils/utils.dart';
import '../../../model/item_model.dart';
import '../../../model/spot_response_model.dart';
// import '../../../services/spot_api_services.dart';
import '../api/base_metal_api_services.dart'; // Import your API service

class BaseMetalCon extends GetxController {
  final String category; // New variable for category
  var spotListResponse = Rx<SpotListResponse?>(null);
  var filteredItems = <SpotItem>[].obs; // type and subcategury vice
  var cityFilteredItems = <SpotItem>[].obs;
  var topOptionIndex = 0.obs;
  var secOptionIndex = 0.obs;
  var _timer;
  // this is for city name for which we going to flter data
  var selectedCities = <String>[].obs;

  // Constructor accepting category
  BaseMetalCon({required this.category});

  @override
  void onInit() {
    super.onInit();
    fetchSpotList();
    startFetchingData();// Fetch the spot list when the controller is initialized
  }
  @override
  void onClose() {
    // Clean up resources here
    // e.g., close any streams, controllers, or listeners
    _timer?.cancel();
    super.onClose();
  }


  Future<void> startFetchingData() async{
    Print.p("Stared fetching $category");
    _timer?.cancel();
   fetchSpotList();
    // Fetch data immediately on start
    // Schedule to fetch data every 10 seconds
    _timer = Timer.periodic(Duration(seconds: 6), (_) async{
      fetchSpotList();
    });
  }
  // Method to fetch the spot list from the API
  Future<void> fetchSpotList() async {
    // SpotListService apiService = BaseMetalApiServices().SpotListService(); // Create an instance of your API service
    spotListResponse.value = await BaseMetalApiServices().fetchSpotList(category); // Fetch data based on the category
    updateFilteredItems(); // Call the filter method after fetching data
  }

  // Method to set top option index
  void setTopOptionIndex(int x) {
    topOptionIndex.value = x;
    secOptionIndex.value = 0; // Reset secondary index when primary changes
    updateFilteredItems(); // Update filtered items whenever the top index changes
  }

  // Method to set secondary option index
  void setSecOptionIndex(int x) {
    secOptionIndex.value = x;
    updateFilteredItems(); // Update filtered items whenever the secondary index changes
  }

  // Method to update filtered items based on the current indices and category
  void updateFilteredItems() {
    if (spotListResponse.value == null) return; // Check if response is available

    // Get the selected type and subcategory based on indices
    var typeSubcategoryList = spotListResponse.value!.typeSubcategoryList;
    if (topOptionIndex.value < typeSubcategoryList.length) {
      var selectedType = typeSubcategoryList[topOptionIndex.value];

      if (secOptionIndex.value < selectedType.subcategories.length) {
        var selectedSubcategory = selectedType.subcategories[secOptionIndex.value];

        // Filter items based on the selected type, subcategory, and category
        filteredItems.value = spotListResponse.value!.items.where((item) {
          return item.type == selectedType.type &&
              item.subcategory == selectedSubcategory &&
              item.category == category; // Additional filtering by category
        }).toList();
        filterByCities();
      }
    }
  }

  // Method to filter items based on selected cities
  void filterByCities() {
    if (selectedCities.isEmpty) {
      cityFilteredItems.value = filteredItems; // No filter applied
    } else {
      cityFilteredItems.value = filteredItems.where((item) {
        return selectedCities.contains(item.city);
      }).toList();
    }
  }

  // Method to show the bottom sheet with city checkboxes
  void showCityFilterBottomSheet() {
    var allCities = filteredItems.map((item) => item.city).toSet().toList();

    showModalBottomSheet(
      context: Get.context!,
      // isScrollControlled: true,
      builder: (context) {
        return Scaffold(
          backgroundColor: ColorConstants.backgroundColor,
          body: Container(
            height: 500,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Header Row with Title and Close Icon
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Select City',
                          textAlign: TextAlign.start,
                          style: GoogleFonts.poppins(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.close,
                          size: 40,
                          color: ColorConstants.greyColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),

                  // City List with Checkboxes
                  Expanded(
                    child: ListView.builder(
                      itemCount: allCities.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        String city = allCities[index];
                        return Obx(() {
                          bool isSelected = selectedCities.contains(city);
                          return CheckboxListTile(
                            title: Text(city),
                            value: isSelected,
                            onChanged: (bool? value) {
                              if (value == true) {
                                selectedCities.add(city);
                              } else {
                                selectedCities.remove(city);
                              }
                              filterByCities(); // Apply the filter after changes
                            },
                            activeColor: ColorConstants.primeryColor,
                          );
                        });
                      },
                    ),
                  ),
                  // SizedBox(height: 20),
                  //
                  // // Apply Changes Button
                  // ElevatedButton(
                  //   onPressed: () {
                  //     filterByCities(); // Ensure the filter is applied
                  //     Navigator.pop(context); // Close the bottom sheet
                  //   },
                  //   style: ElevatedButton.styleFrom(
                  //     backgroundColor: ColorConstants.primeryColor,
                  //     padding: const EdgeInsets.symmetric(vertical: 15.0),
                  //     textStyle: GoogleFonts.poppins(
                  //       fontSize: 18,
                  //       fontWeight: FontWeight.w500,
                  //     ),
                  //   ),
                  //   child: Center(
                  //     child: Text('Apply Changes'),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

}
