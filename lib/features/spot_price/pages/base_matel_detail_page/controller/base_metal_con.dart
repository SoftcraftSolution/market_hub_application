import 'package:get/get.dart';
import '../../../model/item_model.dart';
import '../../../model/spot_response_model.dart';
// import '../../../services/spot_api_services.dart';
import '../api/base_metal_api_services.dart'; // Import your API service

class BaseMetalCon extends GetxController {
  final String category; // New variable for category
  var spotListResponse = Rx<SpotListResponse?>(null);
  var filteredItems = <SpotItem>[].obs; // Observable list for filtered items

  var topOptionIndex = 0.obs;
  var secOptionIndex = 0.obs;

  // Constructor accepting category
  BaseMetalCon({required this.category});

  @override
  void onInit() {
    super.onInit();
    fetchSpotList(); // Fetch the spot list when the controller is initialized
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
      }
    }
  }
}
