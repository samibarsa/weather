import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather/core/constant/strings.dart';
import 'package:weather/core/util/api_servce.dart';
import 'package:weather/core/util/app_router.dart';
import 'package:weather/features/home/data/datasources/home_remote_data_source.dart';
import 'package:weather/features/home/data/repositories/weather_repo_impl.dart';
import 'package:weather/features/home/domain/usecases/weather_use_case.dart';
import 'package:weather/features/home/presentation/manager/cubit/weather_cubit.dart';
import 'package:weather/features/home/presentation/pages/home_page.dart';

import 'package:location/location.dart';

void main() {
  runApp(WeatherApp(
    appRouter: AppRouter(),
  ));
}

// ignore: must_be_immutable
class WeatherApp extends StatelessWidget {
  WeatherApp({super.key, required, required this.appRouter});

  RemoteDataSourceImpl remoteDataSourceImpl =
      RemoteDataSourceImpl(ApiService(Dio()));

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return ScreenUtilInit(
      designSize: Size(AppSize.width, AppSize.hight),
      splitScreenMode: true,
      minTextAdapt: true,
      builder: (context, child) => BlocProvider(
        create: (context) => WeatherCubit(
          WeatherUseCase(
            HomeRepoImpl(remoteDataSourceImpl),
          ),
        ),
        child: MaterialApp(
            onGenerateRoute: appRouter.getRote,
            theme:
                ThemeData(brightness: Brightness.dark, fontFamily: 'sf_font'),
            debugShowCheckedModeBanner: false,
            home: HomePage()),
      ),
    );
  }
}
