import '../../../../../core/api/api_services.dart';

class MCXPageApiServices{
  Future<List> fetchMCXData() async {
    try {
      final response = await BaseApiServices.dio.get('http://mcx.markethubindia.com/api/mcx');
      if (response.statusCode == 200) {
        return response.data; // Update the observable list
      } else {
        print('Failed to load data: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      print('Error: $e');
      return [];
    }
  }
}