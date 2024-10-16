import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constants/color_constant.dart';

class OptionBarWithBorder extends StatefulWidget {
  final List<String> options; // Options to display
  final Function(int) onIndexChanged; // Callback function for index changes

  OptionBarWithBorder({
    Key? key,
    required this.options,
    required this.onIndexChanged,
  }) : super(key: key);

  @override
  _OptionBarWithBorderState createState() => _OptionBarWithBorderState();
}

class _OptionBarWithBorderState extends State<OptionBarWithBorder> {
  late int selectedIndex; // State variable to track selected index

  @override
  void initState() {
    super.initState();
    selectedIndex = 0; // Initialize with the first index or any default index you prefer
  }

  void _updateIndex(int index) {
    setState(() {
      selectedIndex = index; // Update the selected index
    });
    widget.onIndexChanged(index); // Call the callback
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(18),
                ),
                clipBehavior: Clip.hardEdge,
                child: Row(
                  children: List.generate(widget.options.length, (index) {
                    return GestureDetector(
                      onTap: () {
                        _updateIndex(index); // Call the method to update the index
                      },
                      child: Container(
                        constraints: BoxConstraints(minWidth: 100),
                        padding: EdgeInsets.symmetric(vertical: 14,horizontal: 18),
                        decoration: BoxDecoration(
                          color: selectedIndex == index
                              ? ColorConstants.primeryColor
                              : Colors.transparent,
                          border: Border(
                            left: BorderSide(color: Colors.grey),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            widget.options[index],
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: selectedIndex == index
                                  ? Colors.white
                                  : Colors.black.withOpacity(0.5),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
