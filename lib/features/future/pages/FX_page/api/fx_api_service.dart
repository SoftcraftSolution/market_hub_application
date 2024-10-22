import 'package:market_hub_application/core/api/api_services.dart';
import 'package:html/parser.dart' as html;

import '../model/fx_model.dart';
class FXApiServices {

  Future<List<FX_model>> fetchFXData() async {
    const url = 'https://www.investing.com/currencies/';
    try {
      // Make a GET request
      final response = await BaseApiServices.dio.get(url);
      if (response.statusCode == 200) {
        // Parse the HTML
        var document = html.parse(response.data);
        var rows = document.querySelectorAll('#cr1 tbody tr');

        List<FX_model> rates = [];

        for (var row in rows) {
          // Scraping name using the updated selector
          var name = row.querySelector('td.bold.left.noWrap.elp.plusIconTd a')?.text.trim() ?? 'N/A';
          var last = row.querySelector('td:nth-child(3)')?.text.trim() ?? 'N/A';
          var open = row.querySelector('td:nth-child(4)')?.text.trim() ?? 'N/A';
          var high = row.querySelector('td:nth-child(5)')?.text.trim() ?? 'N/A';
          var low = row.querySelector('td:nth-child(6)')?.text.trim() ?? 'N/A';
          var change = row.querySelector('td:nth-child(7)')?.text.trim() ?? 'N/A';
          var percentChange = row.querySelector('td:nth-child(8)')?.text.trim() ?? 'N/A';
          var time = row.querySelector('td:nth-child(9)')?.text.trim() ?? 'N/A';

          // Add to list
          rates.add(FX_model.fromMap({
            'name': name,
            'last': last,
            'open': open,
            'high': high,
            'low': low,
            'change': change,
            'percentChange': percentChange,
            'time': time,
          }));
        }

        return rates; // Return the scraped rates
      } else {
        throw Exception('Failed to load currency rates');
      }
    } catch (e) {
      print('Error fetching data: $e');
      return []; // Return an empty list in case of error
    }
  }


}



