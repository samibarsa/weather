import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather/core/constant/images_path.dart';

class HouseImage extends StatelessWidget {
  const HouseImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 85.h),
      child: SizedBox(
        width: 390.w,
        height: 390.h,
        child: Image.asset(
          houseImage,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
