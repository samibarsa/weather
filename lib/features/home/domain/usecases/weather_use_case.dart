import 'package:dartz/dartz.dart';
import 'package:weather/core/errors/failures.dart';
import 'package:weather/features/home/data/repositories/weather_repo_impl.dart';
import 'package:weather/features/home/domain/entities/weather_entity.dart';

class WeatherUseCase {
  final HomeRepoImpl homeRepoImpl;

  WeatherUseCase(this.homeRepoImpl);

  Future<Either<Failure, List<WeatherEntity>>> fetchData(
      String cityName) async {
    return await homeRepoImpl.getweather(cityName);
  }
}
