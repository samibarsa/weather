import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather/core/constant/images_path.dart';

class RectangleImage extends StatelessWidget {
  const RectangleImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500.h,
      width: 390.w,
      child: Transform(
        alignment: Alignment.center,
        transform: Matrix4.rotationZ(0),
        child: Image.asset(
          rectanglImage,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
