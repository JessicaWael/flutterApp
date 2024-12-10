import 'package:app/generated/l10n.dart';
import 'package:app/src/feature/feed/view/Widgets/my_cutom_text.dart';
import 'package:app/src/feature/feed/view/Widgets/row_card_widget.dart';
import 'package:app/src/feature/feed/view/buy_screen/buy_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class ItemDetailsWidget extends StatelessWidget {
  final String imageName, firstText, itemName, itemPrice, today, percentage;
  const ItemDetailsWidget({
    super.key,
    required this.imageName,
    required this.firstText,
    required this.itemName,
    required this.itemPrice,
    required this.today,
    required this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Container(
                  height: 50,
                  width: 60,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Image.asset(
                    imageName,
                    alignment: Alignment.center,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyCustomText(
                    text: firstText,
                    color: Colors.grey,
                    fontSize: 19,
                  ),
                  MyCustomText(
                    text: itemName,
                    fontWeight: FontWeight.bold,
                    fontSize: 19,
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: MyCustomText(
              text: itemPrice,
              fontSize: 19,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Image.asset('assets/images/Arrow_down.png'),
              const SizedBox(
                width: 4,
              ),
              MyCustomText(
                text: 'EGP 43.12 ($percentage)  ',
                fontWeight: FontWeight.bold,
              ),
              MyCustomText(
                text: today,
                fontWeight: FontWeight.w400,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Center(
              child: SvgPicture.asset(
                'assets/images/Line_chart_curved.svg',
                width: 150,
                height: 220,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RowCardWidget(
                  text: '1D',
                  color: Colors.red,
                  textColor: Colors.white,
                ),
                RowCardWidget(
                  text: '1W',
                ),
                RowCardWidget(
                  text: '1M',
                ),
                RowCardWidget(
                  text: '6M',
                ),
                RowCardWidget(
                  text: '1Y',
                ),
                RowCardWidget(
                  text: '5Y',
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: Row(
              children: [
                SizedBox(
                  width: 25,
                ),
                Expanded(
                  child: Divider(
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  width: 25,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: MyCustomText(
              text: S.of(context).Constituente,
              fontWeight: FontWeight.bold,
              fontSize: 21,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 20),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BuyScreen(
                          imageName: imageName,
                          firstText: firstText,
                          itemName: itemName,
                          itemPrice: itemPrice,
                          today: today,
                          percentage: percentage,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: 39,
                    width: 38,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black87),
                        borderRadius: BorderRadius.circular(9)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Row(
                    children: [
                      Gap(10.w),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // ignore: prefer_const_constructors
                          MyCustomText(
                            text: 'COMI',
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.w800,
                          ),
                          MyCustomText(
                            text: S.of(context).Commercial_international_bank,
                            fontWeight: FontWeight.bold,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 5),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          const MyCustomText(text: '80.00'),
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/Arrow_down.png',
                                width: 40,
                              ),
                              const MyCustomText(
                                text: '3.05%',
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
