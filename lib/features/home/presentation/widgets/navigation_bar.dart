// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geocoding/geocoding.dart';

import 'package:location/location.dart' as l;
import 'package:weather/core/constant/images_path.dart';
import 'package:weather/core/constant/strings.dart';
import 'package:weather/features/home/presentation/manager/cubit/weather_cubit.dart';
import 'package:weather/features/home/presentation/widgets/bottom_sheet.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({
    super.key,
  });

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 49.95.h),
            child: Stack(
              children: [
                SizedBox(
                  width: AppSize.width.w,
                  child: SvgPicture.asset(
                    navigationBar,
                    fit: BoxFit.fill,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () async {
                        l.Location location = l.Location();

                        bool _serviceEnabled;
                        l.PermissionStatus _permissionGranted;
                        // ignore: unused_local_variable
                        l.LocationData _locationData;

                        _serviceEnabled = await location.serviceEnabled();
                        if (!_serviceEnabled) {
                          _serviceEnabled = await location.requestService();
                          if (!_serviceEnabled) {
                            return;
                          }
                        }

                        _permissionGranted = await location.hasPermission();
                        if (_permissionGranted == l.PermissionStatus.denied) {
                          _permissionGranted =
                              await location.requestPermission();
                          if (_permissionGranted !=
                              l.PermissionStatus.granted) {
                            return;
                          }
                        }

                        _locationData = await location.getLocation();

                        try {
                          List<Placemark> placemarks =
                              await placemarkFromCoordinates(
                            _locationData.latitude!,
                            _locationData.longitude!,
                          );
                          // ignore: use_build_context_synchronously
                          BlocProvider.of<WeatherCubit>(context)
                              .getWeather(placemarks[0].locality!);

                          log("\n\n/n/n/n/n/n/n/n/n/n/n ${placemarks[0].name}");
                        } catch (err) {
                          print(err.toString());
                        }
                      },
                      child: Padding(
                        padding: EdgeInsets.only(top: 10.h, right: 0.w),
                        child: SizedBox(
                          height: 44.h,
                          width: 44.w,
                          child: SvgPicture.asset(lacationButton),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: EdgeInsets.only(top: 0.h, right: 14.w),
                        child: SizedBox(
                          child: SizedBox(
                              height: 95.h,
                              width: 115.w,
                              child: SvgPicture.asset(plusButton)),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        bottomSheet(context, tabController);
                      },
                      child: Padding(
                        padding: EdgeInsets.only(top: 15.h, right: 10.w),
                        child: SizedBox(
                          height: 22.h,
                          width: 22.w,
                          child: SvgPicture.asset(detailesButton),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
