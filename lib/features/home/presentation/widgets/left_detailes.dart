// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LeftDetalies extends StatelessWidget {
  const LeftDetalies({
    super.key,
    required this.temp,
    required this.l_temp,
    required this.h_temp,
    required this.name,
  });
  final int temp;
  final int l_temp;
  final int h_temp;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: 40.h,
            left: 20.w,
            bottom: 15,
          ),
          child: Text(
            "$temp°",
            style: TextStyle(
                fontSize: 60.sp,
                fontWeight: FontWeight.w500,
                fontFamily: 'sf_font'),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 20.w,
          ),
          child: Text(
            "H:$h_temp°  L:$l_temp°",
            // ignore: prefer_const_constructors
            style:
                TextStyle(color: const Color(0xffEBEBF5).withOpacity(60 / 100)),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: SizedBox(
            width: 100.w,
            child: Text(
              name,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ),
      ],
    );
  }
}


