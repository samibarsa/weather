// ignore_for_file: non_constant_identifier_names

import 'package:weather/features/home/presentation/manager/cubit/weather_cubit.dart';

class WeatherEntity {
  final double current_temp;
  final double h_temp;
  final double l_temp;
  final String State;
  final String cityName;
  final double avg_temp;
  final String date;
  final List<dynamic> hour;
  final String statusWeakly;

  WeatherEntity(
      {required this.current_temp,
      required this.statusWeakly,
      required this.date,
      required this.hour,
      required this.avg_temp,
      required this.h_temp,
      required this.l_temp,
      required this.State,
      required this.cityName});

  String getDayOfWeeak(int index, WeatherState state) {
    int year, mounth, dayofmounth;
    late DateTime dateTime;
    if (state is WeatherSuccess) {
      year = int.parse(state.weather[index].date.toString().split('-')[0]);
      mounth = int.parse(state.weather[index].date.toString().split('-')[1]);
      dayofmounth =
          int.parse(state.weather[index].date.toString().split('-')[2]);
      dateTime = DateTime(year, mounth, dayofmounth);
    }
    if (dateTime.weekday == 1) {
      return "MON";
    } else if (dateTime.weekday == 2) {
      return "TUE";
    } else if (dateTime.weekday == 3) {
      return "WED ";
    } else if (dateTime.weekday == 4) {
      return "THU";
    } else if (dateTime.weekday == 5) {
      return "FRI";
    } else if (dateTime.weekday == 6) {
      return "SAT";
    } else if (dateTime.weekday == 7) {
      return "SUN";
    }
    return "UNKNOWN";
  }

  String getImage(String status) {
    if (status == 'Sunny' || status == 'Clear' || status == 'partly cloudy') {
      return 'assets/images/forcast/Animation - 1711928892500.gif';
    } else if (status == 'Blizzard' ||
        status == 'Patchy snow possible' ||
        status == 'Patchy light snow' ||
        status == 'light snow' ||
        status == 'Light snow' ||
        status == 'Patchy sleet possible' ||
        status == 'Patchy freezing drizzle possible' ||
        status == 'Blowing snow') {
      return 'assets/images/forcast/weather_snowy.gif';
    } else if (status == 'Freezing fog' ||
        status == 'Fog' ||
        status == 'Heavy Cloud' ||
        status == 'Mist' ||
        status == 'Partly Cloudy ' ||
        status == 'Cloudy' ||
        status == 'cloudy' ||
        status == 'Partly cloudy' ||
        status == 'Overcast' ||
        status == 'overcast' ||
        status == 'Fog') {
      return 'assets/images/forcast/cloudy.gif';
    } else if (status == 'Patchy rain possible' ||
        status == 'Patchy rain nearby' ||
        status == 'Heavy Rain' ||
        status == 'Patchy light drizzle' ||
        status == 'Showers  ') {
      return 'assets/images/forcast/weather_rainy.gif';
    } else if (status == 'Thundery outbreaks possible' ||
        status == 'Moderate or heavy snow with thunder' ||
        status == 'Patchy light snow with thunder' ||
        status == 'Moderate or heavy rain with thunder' ||
        status == 'Light rain shower' ||
        status == 'Patchy light rain with thunder') {
      return 'assets/images/forcast/hello.gif';
    } else {
      return 'assets/images/forcast/Animation - 1711928892500.gif';
    }
  }
}
