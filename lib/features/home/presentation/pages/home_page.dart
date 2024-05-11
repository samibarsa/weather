// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather/features/home/domain/entities/weather_entity.dart';
import 'package:weather/features/home/presentation/manager/cubit/weather_cubit.dart';
import 'package:weather/features/home/presentation/widgets/home_body.dart';
import 'package:weather/features/home/presentation/widgets/home_page_appbar.dart';
import 'package:weather/features/home/presentation/widgets/list_item.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  List<WeatherEntity> data = [];
  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
    return Scaffold(
      // backgroundColor: const Color(0xff31305e).withOpacity(1),
      extendBodyBehindAppBar: true,
      appBar: homePageAppBar(),

      // backgroundColor: const Color(0xff2F3C50),
      body: BlocConsumer<WeatherCubit, WeatherState>(
        listener: (context, state) {
          if (state is WeatherLoading) {
            isLoading = true;
          } else if (state is WeatherSuccess || state is WeatherFailure) {
            isLoading = false;
          } else if (state is WeatherFailure) {
            print(state.errmessage);
            throw ArgumentError(state.errmessage);
          }
        },
        builder: (context, state) {
          if (state is WeatherLoading) {
            return ModalProgressHUD(
                progressIndicator: Image.asset(
                  'assets/images/Animation - 1711406527649.gif',
                  color: const Color.fromARGB(255, 178, 126, 255),
                ),
                opacity: 0,
                inAsyncCall: isLoading,
                child: const HomeBody(child: Text('')));
          } else if (state is WeatherSuccess) {
            data = state.weather;
            return HomeBody(
              child: ListView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: false,
                children: [
                  Column(
                    children: [
                      Positioned(
                        child: SizedBox(
                          height: 710.h,
                          child: ListView.builder(
                            physics: const ClampingScrollPhysics(),
                            itemCount: (state.weather.length) ~/ 3,
                            itemBuilder: (context, index) {
                              return BlocBuilder<WeatherCubit, WeatherState>(
                                builder: (context, state) {
                                  return ListViewItem(
                                    data: data,
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            );
          } else if (state is WeatherFailure) {
            return HomeBody(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                        height: 60.h,
                        width: 60.w,
                        'assets/images/error-icon-32.png'),
                    Text(state.errmessage)
                  ],
                ),
              ),
            );
          } else if (state is WeatherInitial) {
            return const HomeBody(child: Text(""));
          } else {
            return const Center(child: Text("unKnouwn Error"));
          }
        },
      ),
    );
  }
}
