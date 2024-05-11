import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather/core/constant/strings.dart';
import 'package:weather/features/home/presentation/widgets/custom_text_field.dart';

AppBar homePageAppBar() {
  return AppBar(
    titleSpacing: 15,
    toolbarHeight: 100.h,
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: Padding(
      padding: EdgeInsets.only(left: 0.w),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(right: 240.w),
            child: Text(
              'Weather',
              style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.w400),
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              gradient: LinearGradient(
                begin: Alignment.topRight,
                colors: [Colors.black38, Colors.transparent.withOpacity(0.15)],
              ),
            ),
            child: SizedBox(
                height: 40.h,
                width: AppSize.width.w,
                child: const CustomTextField()),
          )
        ],
      ),
    ),
  );
}
 /** 
  * 


import 'package:weather/features/home/presentation/widgets/custom_text_field.dart';
Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              gradient: LinearGradient(
                                begin: Alignment.topRight,
                                colors: [
                                  Colors.black38,
                                  Colors.transparent.withOpacity(0.15)
                                ],
                              ),
                            ),
                            child: const customTextField(),
                          )

  */