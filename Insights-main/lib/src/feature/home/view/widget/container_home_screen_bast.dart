// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ContainerHomeScreenBast extends StatelessWidget {
  final String title;
  final List<dynamic> stocks;
  final bool isProfitable;

  const ContainerHomeScreenBast({
    Key? key,
    required this.title,
    required this.stocks,
    required this.isProfitable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.w,
      decoration: BoxDecoration(
        color: Color(0xFFDFEBF6),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Text(
              title,
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: stocks.length,
              itemBuilder: (context, index) {
                final stock = stocks[index];
                return ListTile(
                  title: Text(stock['AssetName']),
                  subtitle: Text(stock['Symbol']),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('\$${stock['Price']}'),
                      Text(
                        isProfitable
                            ? '${stock['CHG']}%'
                            : 'Vol: ${stock['Volume']}',
                        style: TextStyle(
                          color: isProfitable
                              ? (double.parse(stock['CHG']) >= 0
                                  ? Colors.green
                                  : Colors.red)
                              : null,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
