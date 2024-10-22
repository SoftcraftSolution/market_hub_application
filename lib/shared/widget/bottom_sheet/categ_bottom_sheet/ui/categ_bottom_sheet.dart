import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:market_hub_application/core/constants/color_constant.dart';
import 'package:market_hub_application/shared/widget/bottom_sheet/categ_bottom_sheet/controller/controller.dart';
import 'package:market_hub_application/shared/widget/button/custom_button.dart';

class CategBottomSheet extends StatefulWidget {
  final List<String> elements;
  final controller;

  CategBottomSheet({required this.elements,required this.controller});

  @override
  State<CategBottomSheet> createState() => _CategBottomSheetState();
}

class _CategBottomSheetState extends State<CategBottomSheet> {
  @override
  void initState() {
    _selectedValue=widget.controller.pageIndex.value;
  }
   int? _selectedValue;// Variable to hold the selected radio value

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: ColorConstants.backgroundColor,
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Select Type',
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
              Expanded(
                child: ListView.builder(
                  itemCount: widget.elements.length, // Use the length of elements
                  itemBuilder: (context, index) {
                    return RadioListTile<int>(
                      title: Text(widget.elements[index]),
                      value: index, // Set the value to the element
                      groupValue: _selectedValue, // Use the selected value
                      onChanged: (value) {
                        setState(() {
                          _selectedValue = value; // Update the selected value
                        });
                      },
                      activeColor: ColorConstants.primeryColor,
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
              CustomButton(
                title: "Apply Changes",
                onPress:
                  // Handle the apply changes logic
                  onApplyChanges
                ,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> onApplyChanges()async{
    widget.controller.seIndex(_selectedValue);
    Navigator.pop(context);
  }
}
