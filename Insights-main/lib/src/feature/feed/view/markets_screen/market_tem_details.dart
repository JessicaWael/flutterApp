import 'package:app/src/feature/feed/view/Widgets/item_details_widget.dart';
import 'package:flutter/material.dart';

class MarketItemDetails extends StatelessWidget {
  final String itemName, itemPrice, imageName, percentage;
  const MarketItemDetails(
      {super.key,
      required this.itemName,
      required this.itemPrice,
      required this.imageName,
      required this.percentage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: ItemDetailsWidget(
            imageName: imageName,
            firstText: itemName,
            itemName: itemName,
            itemPrice: itemPrice,
            today: 'Today',
            percentage: percentage,
          ),
        ),
      ),
    );
  }
}
