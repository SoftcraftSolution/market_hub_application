import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/constants/color_constant.dart';
import '../../../../watchlst/controller/watchlist_data_con.dart';
import '../model/fx_model.dart';

class FXCard extends StatelessWidget {
  final FXModel fxData;
  late bool isPriceNegative;

  FXCard({Key? key, required this.fxData});
  var con = Get.find<WatchlistDataController>();
  @override
  Widget build(BuildContext context) {
    isPriceNegative = fxData.change.startsWith('-');

    return Container(
      decoration: BoxDecoration(

        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSymbolSection(),
            const SizedBox(height: 10),
            _buildPriceSection(),
            const SizedBox(height: 10),
            Divider(),
          ],
        ),
      ),
    );
  }

  Widget _buildSymbolSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 100,
                child: Text(
                  fxData.name,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 5),
              Icon(
                isPriceNegative ? Icons.arrow_drop_down : Icons.arrow_drop_up,
                color: isPriceNegative ? Colors.red : Colors.green,
                size: 26,
              ),
              Obx(
                    () {
                  // Print.p("lme item" + marketData.toString());
                  return GestureDetector(
                    onTap: () {
                      con.fxWatchlistIds.value.contains(
                          fxData.id.toString())
                          ? con.removeItem(fxData.id.toString())
                          : con.addItem(fxIds: [fxData.id.toString()]);
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(Get.context!).size.width * 0.02,
                      ),
                      child: con.fxWatchlistIds.value
                          .contains(fxData.id.toString())
                          ? Icon(
                        Icons.bookmark,
                        color: ColorConstants.primeryColor,
                      )
                          : Icon(Icons.bookmark_border_rounded),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        Expanded(
          child: Text(
            fxData.price,
            textAlign: TextAlign.end,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: isPriceNegative ? Colors.red : Colors.green,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPriceSection() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Row(
            children: [
              Icon(Icons.access_time, size: 14, color: Colors.grey),
              const SizedBox(width: 4),
              Text(
                '${fxData.updatedAt.toLocal().toString().split(" ")[1].split(".")[0]}',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        _buildDetail(
          '${fxData.change}',
          isPriceNegative ? Colors.red : Colors.green,
        ),
      ],
    );
  }

  Widget _buildDetail(String text, Color color) {
    return Expanded(
      child: Text(
        text,
        textAlign: TextAlign.end,
        style: GoogleFonts.poppins(
          fontSize: 14,
          color: color,
        ),
      ),
    );
  }
}
