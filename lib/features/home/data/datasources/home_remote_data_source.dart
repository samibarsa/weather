import 'package:weather/core/util/api_servce.dart';
import 'package:weather/features/home/data/models/weather_model.dart';
import 'package:weather/features/home/domain/entities/weather_entity.dart';

abstract class HomeRempteDataSource {
  Future<List<WeatherEntity>> getweather(String cityName);
}

class RemoteDataSourceImpl extends HomeRempteDataSource {
  final ApiService apiService;

  RemoteDataSourceImpl(this.apiService);

  @override
  Future<List<WeatherEntity>> getweather(String cityName) async {
    List<WeatherEntity> weather = [];
    var data = await apiService.get(
        'forecast.json?key=6cf046ba4dda4938a55122854232703&q=$cityName&days=10&aqi=no&alerts=no');

    for (int i = 0; i <= 2; i++) {
      weather.add(WeatherModel.fromjson(data, i));
    }
    return weather;
  }
}
