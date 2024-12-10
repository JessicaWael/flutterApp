import 'dart:convert';

import 'package:app/generated/l10n.dart';
import 'package:app/src/data/model/dataclass/data_sectors.dart';
import 'package:app/src/feature/home/view/widget/container_home_screen_bast.dart';
import 'package:app/src/feature/navicator_sectors/view/general_sector_screen.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart'; // Import this package for date formatting
import 'package:shared_preferences/shared_preferences.dart'; // Import SharedPreferences
import 'package:http/http.dart' as http;
import '../../../../../api_connection/api_connection.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String userName = '';
  List<dynamic> profitableStocks = [];
  List<dynamic> bestSellingStocks = [];
  bool isLoading = true;
  List<String> listSectors1 = [
    "banks",
    "Industrial services products and cars",
    "real estate"
        "tourism and entertainment",
    "communications media and information technology",
    "food drinks and tobacco",
    "energy and support services",
    "traders and distributors",
    "transportation and shipping services",
  ];
  List<String> listSectors2 = [
    "educational services",
    "non banking financial services",
    "engineering contracting and construction",
    "textiles and durable goods",
    "building materials",
    "Health care and medicines",
    "basic resources",
    "paper and packaging materials",
  ];

  @override
  void initState() {
    super.initState();
    _loadUserName();
    fetchStockData();
  }

  _loadUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userName = prefs.getString('firstName') ?? 'User';
    });
  }

  Future<void> fetchStockData() async {
    try {
      final response = await http.get(Uri.parse(API.fetchStocks));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          profitableStocks = data['profitable'];
          bestSellingStocks = data['bestselling'];
          isLoading = false;
        });
      } else {
        throw Exception('Failed to load stock data');
      }
    } catch (e) {
      print('Error fetching stock data: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String currentDate = DateFormat('EEEE, d MMM, yyyy').format(DateTime.now());

    return Stack(
      children: [
        SvgPicture.asset(
          'assets/images/BG.svg',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${S.of(context).Hi} $userName!",
                      style: TextStyle(
                          fontSize: 32.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                    Text(
                      currentDate,
                      style: TextStyle(color: Colors.grey.shade400),
                    ),
                    Gap(25.h),
                    /*TextFormField(
                      decoration: InputDecoration(
                        prefixIcon:
                            SvgPicture.asset('assets/icons/Search_alt.svg'),
                        fillColor: Colors.white,
                        filled: true,
                        contentPadding: EdgeInsets.only(left: 12.w),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.r),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.r),
                        ),
                      ),
                    ),*/
                    Gap(120.h),
                    isLoading
                        ? Center(child: CircularProgressIndicator())
                        : SizedBox(
                            height: 380.h,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                ContainerHomeScreenBast(
                                  title:
                                      S.of(context).The_most_profitable_stocks,
                                  stocks: profitableStocks,
                                  isProfitable: true,
                                ),
                                Gap(20.h),
                                ContainerHomeScreenBast(
                                  title: S.of(context).Best_selling_stocks,
                                  stocks: bestSellingStocks,
                                  isProfitable: false,
                                ),
                              ],
                            ),
                          ),
                    Gap(20.h),
                    Text(
                      S.of(context).sectors,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 24.sp,
                          color: Color.fromARGB(255, 6, 24, 41)),
                    ),
                    Gap(10.h),
                    Container(
                      height: 120.h,
                      child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        children: [
                          Column(
                            children: [
                              Container(
                                height: 50.h,
                                child: ListView.separated(
                                  physics: NeverScrollableScrollPhysics(),
                                  separatorBuilder: (context, index) =>
                                      Gap(10.h),
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) => InkWell(
                                    onTap: () {
                                      if (index == 0) {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                GeneralSectorScreen(
                                              name: DataSectorsEn.banks,
                                              index: index,
                                              title: S.of(context).banks,
                                            ),
                                          ),
                                        );
                                      } else if (index == 1) {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                GeneralSectorScreen(
                                              name: DataSectorsEn.industrial,
                                              index: index,
                                              title: S
                                                  .of(context)
                                                  .Industrial_services_products_and_cars,
                                            ),
                                          ),
                                        );
                                      } else if (index == 2) {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                GeneralSectorScreen(
                                              name: DataSectorsEn.real,
                                              index: index,
                                              title: S.of(context).real_estate,
                                            ),
                                          ),
                                        );
                                      } else if (index == 4) {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                GeneralSectorScreen(
                                              name:
                                                  DataSectorsEn.communications,
                                              index: index,
                                              title: S
                                                  .of(context)
                                                  .communications_media_and_information_technology,
                                            ),
                                          ),
                                        );
                                      } else if (index == 5) {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                GeneralSectorScreen(
                                              name: DataSectorsEn.food,
                                              index: index,
                                              title: S
                                                  .of(context)
                                                  .food_drinks_and_tobacco,
                                            ),
                                          ),
                                        );
                                      } else if (index == 8) {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                GeneralSectorScreen(
                                              name:
                                                  DataSectorsEn.transportation,
                                              index: index,
                                              title: S
                                                  .of(context)
                                                  .transportation_and_shipping_services,
                                            ),
                                          ),
                                        );
                                      }
                                    },
                                    child: WidgetSectors(
                                      title1: listSectors1[index],
                                      isSelected: true,
                                    ),
                                  ),
                                  itemCount: listSectors1.length,
                                ),
                              ),
                              Gap(10.h),
                              Container(
                                height: 50.h,
                                child: ListView.separated(
                                  physics: const NeverScrollableScrollPhysics(),
                                  separatorBuilder: (context, index) =>
                                      Gap(10.h),
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) => InkWell(
                                    onTap: () {
                                      if (index == 1) {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                GeneralSectorScreen(
                                              name: DataSectorsEn.nonBanking,
                                              index: index,
                                              title: S
                                                  .of(context)
                                                  .non_banking_financial_services,
                                            ),
                                          ),
                                        );
                                      } else if (index == 2) {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                GeneralSectorScreen(
                                              name: DataSectorsEn.engineering,
                                              index: index,
                                              title: S
                                                  .of(context)
                                                  .engineering_contracting_and_construction,
                                            ),
                                          ),
                                        );
                                      } else if (index == 3) {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                GeneralSectorScreen(
                                              name: DataSectorsEn.textiles,
                                              index: index,
                                              title: S
                                                  .of(context)
                                                  .textiles_and_durable_goods,
                                            ),
                                          ),
                                        );
                                      } else if (index == 5) {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                GeneralSectorScreen(
                                              name: DataSectorsEn.health,
                                              index: index,
                                              title: S
                                                  .of(context)
                                                  .Health_care_and_medicines,
                                            ),
                                          ),
                                        );
                                      } else if (index == 6) {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                GeneralSectorScreen(
                                              name: DataSectorsEn.basic,
                                              index: index,
                                              title:
                                                  S.of(context).basic_resources,
                                            ),
                                          ),
                                        );
                                      }
                                    },
                                    child: WidgetSectors(
                                      title1: listSectors2[index],
                                      isSelected: true,
                                    ),
                                  ),
                                  itemCount: listSectors2.length,
                                  //////////////////
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class WidgetSectors extends StatelessWidget {
  String title1;

  bool isSelected;
  WidgetSectors({
    super.key,
    required this.title1,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      // width: 100.w,

      padding: EdgeInsets.symmetric(
        horizontal: 10.h,
      ), // (10.h),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white,
        ),
        borderRadius: BorderRadius.circular(20.r),
        color: Color(0xff0D204B),
      ),
      alignment: Alignment.center,

      child: Text(
        title1,
        maxLines: 1,
        // overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 22.sp,
          color: Color(0xFFDFEBF6),
        ),
      ),
    );
  }
}
