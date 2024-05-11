import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather/features/home/presentation/manager/cubit/weather_cubit.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (cityName) {
        BlocProvider.of<WeatherCubit>(context).getWeather(cityName);
      },
      focusNode: FocusScopeNode(canRequestFocus: false),

      // textAlignVertical: TextAlignVertical.top,

      textAlign: TextAlign.start,
      cursorOpacityAnimates: true,
      // style: const TextStyle(height: 0.7),
      cursorHeight: 23.h,
      decoration: InputDecoration(
        label: Row(
          children: [
            SvgPicture.asset('assets/svg/search.svg'),
            const Text(' Search for a city or airport')
          ],
        ),
        filled: false,
        contentPadding:
            const EdgeInsets.only(top: 3, bottom: 0, left: 5, right: 1),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.transparent,
            width: 4,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10.r),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.transparent,
            width: 4,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10.r),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.transparent,
            width: 4,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10.r),
          ),
        ),
      ),
    );
  }
}
