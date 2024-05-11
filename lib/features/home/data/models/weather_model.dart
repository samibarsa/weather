// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names, annotate_overrides, overridden_fields
import 'package:weather/features/home/domain/entities/weather_entity.dart';

class WeatherModel extends WeatherEntity {
  late double current_temp_c;
  late double h_temp_c;
  late double avg_temp_c;
  late double l_temp_c;
  late String State;
  late String date;
  late String cityname;
  late String statusWeakly;
  late String statusHourly;
  late List<dynamic> hours;
  WeatherModel({
    required this.date,
    required this.statusWeakly,
    required this.avg_temp_c,
    required this.current_temp_c,
    required this.hours,
    required this.h_temp_c,
    required this.l_temp_c,
    required this.State,
    required this.cityname,
  }) : super(
            current_temp: current_temp_c,
            statusWeakly: statusWeakly,
            date: date,
            h_temp: h_temp_c,
            avg_temp: avg_temp_c,
            l_temp: l_temp_c,
            State: State,
            cityName: cityname,
            hour: hours);

  factory WeatherModel.fromjson(
    Map<String, dynamic> json,
    int index,
  ) {
    return WeatherModel(
        statusWeakly: json['forecast']['forecastday'][index]['day']['condition']
            ['text'],
        avg_temp_c: json['forecast']['forecastday'][index]['day']['avgtemp_c'],
        current_temp_c: json['current']['temp_c'],
        h_temp_c: json['forecast']['forecastday'][index]['day']['maxtemp_c'],
        l_temp_c: json['forecast']['forecastday'][index]['day']['mintemp_c'],
        State: json['current']['condition']['text'],
        cityname: json['location']['name'],
        hours: json['forecast']['forecastday'][index]['hour'],
        date: json['forecast']['forecastday'][index]['date']);
  }
}
