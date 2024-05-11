// ignore_for_file: unused_local_variable

import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:weather/core/constant/strings.dart';
import 'package:weather/features/home/presentation/manager/cubit/weather_cubit.dart';
import 'package:weather/features/home/presentation/widgets/hourly_forcast.dart';
import 'package:weather/features/home/presentation/widgets/list_view_bottomsheet_item.dart';

Future<dynamic> bottomSheet(BuildContext context, TabController tabController) {
  return showMaterialModalBottomSheet(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(44)),
    ),
    clipBehavior: Clip.hardEdge,
    backgroundColor: const Color(0xff454265).withAlpha(190),
    context: context,
    builder: (context) => BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('assets/images/bottom_sheet1.png'),
          ),
        ),
        height: 300.h,
        child: Column(
          children: [
            TabBar(
              controller: tabController,
              tabs: [
                Padding(
                  padding: EdgeInsets.only(top: 8.h, bottom: 5.h),
                  child: Text(
                    "Hourly Forecast",
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: const Color(0xffEBEBF5).withOpacity(60 / 100),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.h, bottom: 5.h),
                  child: Text(
                    "Weekly Forecast",
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: const Color(0xffEBEBF5).withOpacity(60 / 100),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 250.h,
              width: AppSize.width.w,
              child: BlocBuilder<WeatherCubit, WeatherState>(
                  builder: (context, state) {
                if (state is WeatherSuccess) {
                  int year;
                  int mounth;
                  int dayofmounth;

                  DateTime dateTime;

                  return TabBarView(
                    controller: tabController,
                    children: [
                      Tab(
                        child: ForecastDetailes(
                            count: 24,
                            itemBuilder: (context, index) =>
                                ListViewBottomsheetItem(
                                  image: state.weather[0].getImage(state
                                      .weather[0]
                                      .hour[index]['condition']['text']),
                                  time: state.weather[0].hour[index]['time']
                                      .toString()
                                      .split(" ")[1],
                                  temp: state.weather[0].hour[index]['temp_c']
                                      .toString()
                                      .split(".")[0],
                                )),
                      ),
                      Tab(
                        child: Padding(
                          padding: EdgeInsets.only(left: 10.w),
                          child: ForecastDetailes(
                              count: 3,
                              itemBuilder: (context, index) {
                                return ListViewBottomsheetItem(
                                  image: state.weather[index].getImage(
                                      state.weather[index].statusWeakly),
                                  time: state.weather[index]
                                      .getDayOfWeeak(index, state),
                                  temp: state.weather[index].avg_temp
                                      .toString()
                                      .split(".")[0],
                                );
                              }),
                        ),
                      )
                    ],
                  );
                }
                return const Text("data");
              }),
            )
          ],
        ),
      ),
    ),
  );
}
