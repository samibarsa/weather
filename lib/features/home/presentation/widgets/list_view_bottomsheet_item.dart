import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather/core/constant/images_path.dart';

class ListViewBottomsheetItem extends StatelessWidget {
  const ListViewBottomsheetItem({
    super.key,
    required this.time,
    required this.image,
    required this.temp,
  });

  final String time;
  final String image;
  final String temp;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 40.h, left: 0.w, right: 0.w),
      child: Container(
        height: 384948935.2746.h,
        width: 75.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.r),
        ),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 12.h, left: 2.w),
              child: SizedBox(
                height: 120.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 0.w, top: 0.h, right: 9.w),
                      child: Text(time),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 15.w, left: 9),
                      child: Image.asset(
                        image,
                        height: 40.h,
                        width: 40.w,
                      ),
                    ),
                    Text(
                      "$temp°",
                      style: TextStyle(
                          fontSize: 25.sp, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ),
            Image.asset(
              hourly,
              fit: BoxFit.fill,
            ),
          ],
        ),
      ),
    );
  }
}
