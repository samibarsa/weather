import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:weather/core/errors/failures.dart';
import 'package:weather/features/home/data/datasources/home_remote_data_source.dart';
import 'package:weather/features/home/domain/entities/weather_entity.dart';
import 'package:weather/features/home/domain/repositories/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final RemoteDataSourceImpl remoteDataSourceImpl;

  HomeRepoImpl(this.remoteDataSourceImpl);
  @override
  Future<Either<Failure, List<WeatherEntity>>> getweather(
      String cityName) async {
    try {
      return Right(await remoteDataSourceImpl.getweather(cityName));
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e),
        );
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
