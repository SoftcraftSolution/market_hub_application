import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constants/color_constant.dart';

class ListOptionWithoutBorder extends StatefulWidget {
  final List<String> elements; // Options to display
  final Function(int) onIndexChanged; // Callback function for index changes

  ListOptionWithoutBorder({
    Key? key,
    required this.elements,
    required this.onIndexChanged,
  }) : super(key: key);

  @override
  _ListOptionWithoutBorderState createState() => _ListOptionWithoutBorderState();
}

class _ListOptionWithoutBorderState extends State<ListOptionWithoutBorder> {
  int selectedIndex = 0; // Local state variable to track selected index

  void _updateIndex(int index) {
    setState(() {
      selectedIndex = index; // Update the selected index
    });
    widget.onIndexChanged(index); // Call the callback
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
        height: 35,
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: widget.elements.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                _updateIndex(index); // Update index on tap
              },
              child: Padding(
                padding:  EdgeInsets.only(right: 20) ,
                child: Container(
                  decoration: BoxDecoration(
                    border: selectedIndex == index
                        ? Border(
                      bottom: BorderSide(
                        width: 4,
                        color: ColorConstants.primeryColor,
                      ),
                    )
                        : null,
                  ),
                  child: Text(
                    widget.elements[index],
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                      color: selectedIndex == index
                          ? ColorConstants.primeryColor
                          : Colors.grey,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
