import 'package:app/generated/l10n.dart';
import 'package:app/src/feature/feed/view/Widgets/my_cutom_text.dart';
import 'package:app/src/feature/feed/view/Widgets/row_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class BuyWidget extends StatelessWidget {
  final String imageName, firstText, itemName, itemPrice, today, percentage;
  const BuyWidget({
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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 15.h),
                      child: Container(
                        height: 50.h,
                        width: 60.w,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(12.r)),
                        child: Image.asset(
                          imageName,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 12.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyCustomText(text: firstText),
                        MyCustomText(text: itemName),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 25.h),
                  child: MyCustomText(
                    text: itemPrice,
                    fontSize: 19.sp,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  children: [
                    Image.asset('assets/images/Arrow_down.png'),
                    const SizedBox(
                      width: 4,
                    ),
                    MyCustomText(text: 'EGP 43.12 ($percentage)  '),
                    MyCustomText(text: today),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Center(
                      child: SvgPicture.asset(
                    'assets/images/Line_chart_curved.svg',
                    width: 150,
                    height: 220,
                  )),
                ),
                const SizedBox(
                  height: 25,
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RowCardWidget(
                        text: '2D',
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
                  height: 45,
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
                      )),
                      SizedBox(
                        width: 25,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 80,
                ),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(310, 50),
                        backgroundColor: Colors.blue[100]),
                    onPressed: () {},
                    child: MyCustomText(
                      text: S.of(context).Buy,
                      fontWeight: FontWeight.bold,
                      fontSize: 21,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
