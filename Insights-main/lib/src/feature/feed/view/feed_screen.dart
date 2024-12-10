import 'package:app/generated/l10n.dart';
import 'package:app/src/data/local_data_base/markets_data.dart';
import 'package:app/src/data/model/dataclass/data_class.dart';
import 'package:app/src/feature/feed/view/Widgets/my_custom_card.dart';
import 'package:app/src/feature/feed/view/Widgets/my_cutom_text.dart';
import 'package:app/src/feature/feed/view/markets_screen/market_tem_details.dart';
import 'package:app/src/feature/feed/view/markets_screen/markets_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  List<MarketModel> visibleMarkets =
      myMarkets.where((market) => !market.isHide).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 15.h),
                  //! markets
                  // ignore: prefer_const_constructors
                  child: MyCustomText(
                    text: S.of(context).Markets,
                    fontSize: 31,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 150.w),
                  child: GestureDetector(
                    //! inkwell
                    onTap: () async {
                      final updatedMarkets = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              MarketsScreen(visibleMarkets: visibleMarkets),
                        ),
                      );
                      if (updatedMarkets != null) {
                        setState(() {
                          visibleMarkets = updatedMarkets;
                        });
                      }
                    },
                    //! view all
                    child: MyCustomText(
                      text: S.of(context).View_all,
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            //! grid view
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 190,
                ),
                itemCount: visibleMarkets.length,
                itemBuilder: (context, index) {
                  final market = visibleMarkets[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    //! inkwell
                    child: GestureDetector(
                      onTap: () {
                         Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                MarketsScreen(visibleMarkets: visibleMarkets),
                          ),
                        );
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => MarketItemDetails(
                        //       itemName: market.name!,
                        //       itemPrice: market.price!,
                        //       imageName: market.image!,
                        //       percentage: market.percentage!,
                        //     ),
                        //   ),
                        // );
                      },
                      child: MyCustomCard(
                        price: market.price!,
                        name: market.name!,
                        percentage: market.percentage!,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
