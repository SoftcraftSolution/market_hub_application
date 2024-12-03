import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:market_hub_application/core/constants/color_constant.dart';
import 'package:market_hub_application/shared/components/loading_page/ui/loading_page.dart';
import '../../../../../../../core/utils/utils.dart';
import '../controller/settelment_con.dart';
import '../model/settelment_model.dart';

class SettlementPage extends StatefulWidget {
  @override
  _SettlementPageState createState() => _SettlementPageState();
}

class _SettlementPageState extends State<SettlementPage> {
  final SettlementController controller = Get.put(SettlementController());

  String selectedFilter = "3M"; // Default filter option

  final Map<String, String> symbolMap = {
    'Copper': 'CU',
    'Aluminium': 'Al',
    'Zinc': 'Zn',
    'Nickel': 'Ni',
    'Lead': 'Pb',
    'Tin': 'Sn',
    'Al. Alloy': 'All',
    'Nasaac': 'Na',
    'Cobalt': 'Co',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: ColorConstants.backgroundColor,
      body: Obx(() {
        if (controller.settlements.isEmpty) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: LoadingPage(cardSize: 70,),
          );
        }
        return ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [_buildFilterButton(),Expanded(child: SizedBox())],)
            ,
            const SizedBox(height: 16),
            _buildSettlementTable(),
          ],
        );
      }),
    );
  }

  Widget _buildFilterButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        // width: 300,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade400, width: 1), // Grey border
          borderRadius: BorderRadius.circular(20), // Rounded border
          color: Colors.transparent, // Transparent background
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
        child: DropdownButton<String>(
          value: selectedFilter,
          icon: const Icon(Icons.arrow_drop_down, color: Colors.black),
          underline: const SizedBox(), // Remove underline
          dropdownColor: Colors.white, // Dropdown background
          items: ["3M", "Cash"].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: GoogleFonts.poppins(fontSize: 14, color: Colors.black),
              ),
            );
          }).toList(),
          onChanged: (newValue) {
            setState(() {
              selectedFilter = newValue!;
            });
          },
        ),
      ),
    );
  }

  Widget _buildSettlementTable() {
    return Container(
      width: MediaQuery.of(context).size.width ,
      child: DataTable(
        dataRowHeight: 56,
        headingRowHeight: 48,
        horizontalMargin: 16,
        columnSpacing: 32,
        headingRowColor: MaterialStateProperty.resolveWith(
                (states) => ColorConstants.primeryColor.withOpacity(0.1)),
        dividerThickness: 0.5,
        border: TableBorder(
          horizontalInside: BorderSide(
            width: 0.8,
            color: Colors.grey.shade400,
            style: BorderStyle.solid,
          ),
        ),
        columns: _buildColumns(),
        rows: controller.settlements.map((settlement) {
          final bid = selectedFilter == "3M"
              ? settlement.threeM.bid.toStringAsFixed(2)
              : settlement.cash.bid.toStringAsFixed(2);
          final ask = selectedFilter == "3M"
              ? settlement.threeM.ask.toStringAsFixed(2)
              : settlement.cash.ask.toStringAsFixed(2);
          return _buildDataRow(settlement, bid, ask);
        }).toList(),
      ),
    );
  }

  List<DataColumn> _buildColumns() {
    return const [
      DataColumn(
        label: Text('Symbol', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      DataColumn(
        label: Text('Date', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      DataColumn(
        label: Text('Bid', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      DataColumn(
        label: Text('Ask', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
    ];
  }

  DataRow _buildDataRow(Settlement settlement, String bid, String ask) {
    return DataRow(
      cells: [
        DataCell(
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(symbolMap[settlement.symbol] ?? settlement.symbol,
                style: GoogleFonts.poppins(fontSize: 14)),
          ),
        ),
        DataCell(
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(formatDateTime(DateTime.parse(settlement.date.toString())).split("12")[0].toString(),
                style: GoogleFonts.poppins(fontSize: 14)),
          ),
        ),
        DataCell(
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(bid, style: GoogleFonts.poppins(fontSize: 14)),
          ),
        ),
        DataCell(
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(ask, style: GoogleFonts.poppins(fontSize: 14)),
          ),
        ),
      ],
    );
  }
}
