import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RightDetailes extends StatelessWidget {
  const RightDetailes({
    super.key,
    required this.status,
    required this.image,
  });
  final String status;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 25.h),
            child: SizedBox(
              height: 130.h,
              width: 130.w,
              child: Image.asset(
                image,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 0.5.w),
            child: Text(
              status,
              style: TextStyle(fontSize: 13.sp),
            ),
          )
        ],
      ),
    );
  }
}
