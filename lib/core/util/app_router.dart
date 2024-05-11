// ignore_for_file: prefer_const_constructors

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/core/util/api_servce.dart';
import 'package:weather/features/home/data/datasources/home_remote_data_source.dart';
import 'package:weather/features/home/data/repositories/weather_repo_impl.dart';
import 'package:weather/features/home/domain/entities/weather_entity.dart';
import 'package:weather/features/home/domain/usecases/weather_use_case.dart';
import 'package:weather/features/home/presentation/manager/cubit/weather_cubit.dart';
import 'package:weather/features/home/presentation/pages/home_page.dart';
import 'package:weather/features/home/presentation/pages/weather_detailes_page.dart';

class AppRouter {
  Route? getRote(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => WeatherCubit(WeatherUseCase(
                HomeRepoImpl(RemoteDataSourceImpl(ApiService(Dio()))))),
            child: HomePage(),
          ),
        );
      case '/weatherDetailes':
        return MaterialPageRoute(
            builder: (context) => BlocBuilder<WeatherCubit, WeatherState>(
                  builder: (context, state) {
                    return WeatherDetailesPage(
                      data: settings.arguments as WeatherEntity,
                    );
                  },
                ));
    }
  }
}
