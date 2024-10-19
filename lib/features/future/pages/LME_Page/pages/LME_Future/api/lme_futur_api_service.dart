import 'package:get/get.dart';
import 'package:html/parser.dart';
import 'package:market_hub_application/features/future/pages/LME_Page/controller/lmePageController.dart';

import '../../../../../../../core/api/api_services.dart';

class LMEFutureApiService{
  Future<List> fetchLMEFutureData() async {
    try {

      final response = await BaseApiServices.dio.get('https://lme-scrap.vercel.app/api/lme-metal-data');
      if (response.statusCode == 200) {
        return response.data; // Update the observable list
      } else {
        print('Failed to load data: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      print('Error: $e');
      return  [];
    }
  }
  //  Map<String, String> metalNameTranslation = {
  //   "LME锡": "LME Tin",
  //   "LME铜": "LME Copper",
  //   "LME铝": "LME Aluminum",
  //   "LME锌": "LME Zinc",
  //   "LME铅": "LME Lead",
  //   "LME镍": "LME Nickel",
  //   "LME合金": "LME Alloy",
  // };
  //
  // Future<List<Map<String, String>>> fetchLMEData() async {
  //   try {
  //      // Create a Dio instance
  //     final url = 'https://quote.fx678.com/exchange/LME';
  //
  //     // Make HTTP GET request using Dio
  //     final response = await BaseApiServices.dio.get(url);
  //
  //     // Check if the response is successful
  //     if (response.statusCode == 200) {
  //       final document = parse(response.data); // Parse the HTML response
  //       final tableRows = document.querySelectorAll('table tr');
  //
  //       List<Map<String, String>> metals = [];
  //
  //       // Skip the header row (index 0) and iterate over table rows
  //       for (var i = 1; i < tableRows.length; i++) {
  //         final cells = tableRows[i].querySelectorAll('td');
  //         if (cells.isNotEmpty) {
  //           final metalNameInChinese = cells[0].text.trim();
  //           final metalName = metalNameTranslation[metalNameInChinese] ?? metalNameInChinese;
  //
  //           final metalData = {
  //             'name': metalName,
  //             'latestPrice': cells[1].text.trim(),
  //             'riseFall': cells[2].text.trim(),
  //             'highest': cells[4].text.trim(),
  //             'lowest': cells[5].text.trim(),
  //             'yesterdayHarvest': cells[6].text.trim(),
  //             'updateTime': cells[7].text.trim(),
  //           };
  //
  //           metals.add(metalData);
  //
  //         }
  //       }
  //
  //       return metals;
  //     } else {
  //       throw Exception('Failed to load LME metal data');
  //     }
  //   } catch (e) {
  //     print('Error scraping data: $e');
  //     return [];
  //   }
  // }
}