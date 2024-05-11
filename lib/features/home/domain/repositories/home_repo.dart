import 'package:dartz/dartz.dart';
import 'package:weather/core/errors/failures.dart';
import 'package:weather/features/home/domain/entities/weather_entity.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<WeatherEntity>>> getweather(String cityName);
}
