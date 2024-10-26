import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:market_hub_application/core/constants/color_constant.dart';
import 'package:market_hub_application/features/spot_price/widget/sport_card.dart';
import '../../spot_price/model/item_model.dart';

class WatchlistPage extends StatefulWidget {
  @override
  _WatchlistPageState createState() => _WatchlistPageState();
}

class _WatchlistPageState extends State<WatchlistPage> {
  // Dummy data for SpotItem
  List<SpotItem> items = [
    SpotItem(
      id: '1',
      city: 'New York',
      category: 'Real Estate',
      type: 'Apartment',
      subcategory: 'Luxury',
      price: '500000',
      incrementPrice: '10000',
      lastPrice: '490000',
      percentageChange: '2%',
      createdAt: DateTime.now().subtract(Duration(days: 10)),
      updatedAt: DateTime.now(),
    ),
    SpotItem(
      id: '2',
      city: 'Los Angeles',
      category: 'Automobiles',
      type: 'Car',
      subcategory: 'Sedan',
      price: '30000',
      incrementPrice: '-500',
      lastPrice: '30500',
      percentageChange: '-1.5%',
      createdAt: DateTime.now().subtract(Duration(days: 5)),
      updatedAt: DateTime.now(),
    ),
    SpotItem(
      id: '3',
      city: 'Chicago',
      category: 'Electronics',
      type: 'Laptop',
      subcategory: 'Gaming',
      price: '1200',
      incrementPrice: '200',
      lastPrice: '1000',
      percentageChange: '20%',
      createdAt: DateTime.now().subtract(Duration(days: 15)),
      updatedAt: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.backgroundColor,
      appBar: AppBar(
        backgroundColor: ColorConstants.backgroundColor,
        title: Text('WatchList',style: GoogleFonts.poppins(fontWeight: FontWeight.w700),),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ReorderableListView(
          padding: EdgeInsets.symmetric(vertical: 8),
          children: [
            for (final item in items)
            // Assign a unique key for each SpotItemCard using its id
              SpotItemCard(key: ValueKey(item.id), item: item),
          ],
          onReorder: (int oldIndex, int newIndex) {
            setState(() {
              if (newIndex > oldIndex) newIndex -= 1;
              final SpotItem item = items.removeAt(oldIndex);
              items.insert(newIndex, item);
            });
          },
        ),
      ),
    );
  }
}
