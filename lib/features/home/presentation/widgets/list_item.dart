// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather/features/home/domain/entities/weather_entity.dart';
import 'package:weather/features/home/presentation/widgets/left_detailes.dart';
import 'package:weather/features/home/presentation/widgets/right_detailes.dart';

class ListViewItem extends StatelessWidget {
  const ListViewItem({
    super.key,
    required this.data,
  });
  final List<WeatherEntity> data;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed('/weatherDetailes', arguments: data[0]);
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w),
            child: SizedBox(
                height: MediaQuery.of(context).size.height <
                        MediaQuery.of(context).size.width
                    ? 600.h
                    : 190.h,
                width: 400.w,
                child: Image.asset(
                  'assets/images/Weather.png',
                  fit: BoxFit.values[0],
                )),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              LeftDetalies(
                h_temp: data[0].h_temp.toInt(),
                l_temp: data[0].l_temp.toInt(),
                name: data[0].cityName,
                temp: data[0].current_temp.toInt(),
              ),
              RightDetailes(
                status: data[0].State,
                image: data[0].getImage(data[0].State),
              )
            ],
          )
        ],
      ),
    );
  }
}
