// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:weather/core/constant/images_path.dart';
import 'package:weather/features/home/presentation/widgets/list_item.dart';
import 'package:weather/features/home/presentation/widgets/list_view_bottomsheet_item.dart';

class ForecastDetailes extends StatelessWidget {
  const ForecastDetailes({
    Key? key,
    required this.itemBuilder,
    required this.count,
  }) : super(key: key);

  final Widget Function(BuildContext, int) itemBuilder;
  final int count;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: count,
        scrollDirection: Axis.horizontal,
        itemBuilder: itemBuilder);
  }
}
