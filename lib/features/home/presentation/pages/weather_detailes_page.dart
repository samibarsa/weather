// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather/core/constant/strings.dart';
import 'package:weather/features/home/domain/entities/weather_entity.dart';
import 'package:weather/features/home/presentation/manager/cubit/weather_cubit.dart';
import 'package:weather/features/home/presentation/widgets/detailes_page_background.dart';
import 'package:weather/features/home/presentation/widgets/house_image.dart';
import 'package:weather/features/home/presentation/widgets/navigation_bar.dart';
import 'package:weather/features/home/presentation/widgets/rectangle_image.dart';

class WeatherDetailesPage extends StatelessWidget {
  const WeatherDetailesPage({
    super.key,
    required this.data,
  });
  final WeatherEntity data;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Container(
              height: AppSize.hight.h,
              width: AppSize.width.w,
              decoration: detailesPageBackground(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        width: AppSize.width.w - 230.w,
                        child: Text(
                          data.cityName,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: 34.sp, fontWeight: FontWeight.w400),
                        ),
                      ),
                      Text(
                        "${data.current_temp.toInt()}°",
                        style: TextStyle(
                            fontSize: 96.sp, fontWeight: FontWeight.w400),
                      ),
                      Text(
                        data.State,
                        style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w400,
                            color:
                                const Color(0xffEBEBF5).withOpacity(60 / 100)),
                      ),
                      Text(
                        "H:${data.h_temp.toInt()}°   L:${data.l_temp.toInt()}°",
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    alignment: AlignmentDirectional.bottomStart,
                    children: [
                      const RectangleImage(),
                      const HouseImage(),
                      Container(
                        height: 100.h,
                        decoration: const BoxDecoration(
                          color: Color(0xff31295b),
                        ),
                      ),
                      const CustomNavigationBar(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
