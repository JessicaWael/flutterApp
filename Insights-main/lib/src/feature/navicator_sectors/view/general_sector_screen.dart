import 'package:app/src/data/local_data_base/markets_data.dart';
import 'package:app/src/data/model/dataclass/data_class.dart';
import 'package:app/src/data/model/dataclass/data_sectors.dart';
import 'package:app/src/feature/feed/view/Widgets/item_details_widget.dart';
import 'package:app/src/feature/feed/view/markets_screen/market_tem_details.dart';
import 'package:app/src/feature/navicator_sectors/view/widget/sector_item_widget.dart';
import 'package:app/src/provider/change_language.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../../generated/l10n.dart';

class GeneralSectorScreen extends StatefulWidget {
  static const String routeName = "GeneralSectorScreen";
  const GeneralSectorScreen(
      {super.key,
      required this.name,
      required this.index,
      required this.title});
  final String name;
  final int index;
  final String title;

  @override
  State<GeneralSectorScreen> createState() => _GeneralSectorScreenState();
}

class _GeneralSectorScreenState extends State<GeneralSectorScreen> {
  late List<DataSectorsEn> sectorListEn;
  late List<DataSectorsAr> sectorListAr;
  @override
  void initState() {
    super.initState();

    sectorListEn = DataSectorsEn.getSectors(name: widget.name);
    sectorListAr = DataSectorsAr.getSectors(name: widget.name);
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ChangeLanguage>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    constraints: BoxConstraints(maxWidth: 360.w),
                    child: Text(
                      widget.title,
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_ios),
                  ),
                ],
              ),
              Gap(70.h),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                child: ListView.separated(
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      List<MarketModel> visibleMarkets =
                          myMarkets.where((market) => !market.isHide).toList();
                      final market = visibleMarkets[3];
                     
                    },
                    child: SectorItemWidget(
                      isEn: provider.language == 'en',
                      sectorListAr: sectorListAr,
                      sectorListEn: sectorListEn,
                      index: index,
                    ),
                  ),
                  separatorBuilder: (context, index) => Divider(
                    endIndent: 30.w,
                    indent: 30.w,
                  ),
                  itemCount: provider.language == 'en'
                      ? sectorListEn.length
                      : sectorListAr.length,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
