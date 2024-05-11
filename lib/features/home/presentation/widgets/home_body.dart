import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather/core/constant/images_path.dart';
import 'package:weather/core/constant/strings.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
    required this.child,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.hight.h,
      width: AppSize.width.w,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              homeBodyBackGroundImage,
            ),
            fit: BoxFit.fill),
      ),
      child: child,
    );
  }
}
