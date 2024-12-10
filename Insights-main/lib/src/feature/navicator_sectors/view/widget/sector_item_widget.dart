import 'package:app/src/data/model/dataclass/data_sectors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class SectorItemWidget extends StatelessWidget {
  SectorItemWidget(
      {super.key,
      required this.sectorListEn,
      required this.index,
      required this.sectorListAr,
      required this.isEn});
  final int index;

  final List<DataSectorsEn> sectorListEn;
  final List<DataSectorsAr> sectorListAr;
  final isEn;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      child: Row(
        children: [
          Image.asset(
            isEn ? sectorListEn[index].image : sectorListAr[index].image,
            height: 60.h,
            width: 60.w,
            fit: BoxFit.contain,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                isEn ? sectorListEn[index].name : sectorListAr[index].name,
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.withOpacity(0.8),
                ),
              ),
              Gap(10.h),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.75,
                child: Row(
                  children: [
                    Container(
                      constraints: BoxConstraints(maxWidth: 280.w),
                      child: Text(
                        isEn
                            ? sectorListEn[index].description
                            : sectorListAr[index].description,
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                    const Spacer(),
                    
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
