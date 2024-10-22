import '../../../../../core/api/api_services.dart';
import '../../../../../core/utils/utils.dart';
import '../model/exchange_rate_model.dart';
// Import your ExchangeRate model

class RefRateApiService {
  Future<Map<String, List<ExchangeRate>>> fetchRefRateData() async {
    try {
      final response = await BaseApiServices.dio.get(
          'https://markethub-app-backend.vercel.app/user/get-reference-rate');

      if (response.statusCode == 200) {
        Print.p(response.data.toString());

        // Extract SBI and RBI data from the response
        List<dynamic> sbiData = response.data["data"]["SBI TT"] ?? []; // Use null-aware operator to avoid null
        List<dynamic> rbiData = response.data["data"]["RBI REFF RATE"] ?? []; // Use null-aware operator to avoid null

        // Parse the data into ExchangeRate model
        List<ExchangeRate> sbiRates = sbiData.map((data) => ExchangeRate.fromSbiJson(data)).toList();
        List<ExchangeRate> rbiRates = rbiData.map((data) => ExchangeRate.fromRbiJson(data)).toList();

        return {
          "sbi_tt": sbiRates,
          "rbi_tt": rbiRates,
        };
      } else {
        print('Failed to load data: ${response.statusCode}');
        return {"sbi_tt": [], "rbi_tt": []}; // Return empty lists for both if there's an error
      }
    } catch (e) {
      print('Error: $e');
      return {"sbi_tt": [], "rbi_tt": []}; // Return empty lists for both in case of an exception
    }
  }
}
