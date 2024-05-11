part of 'weather_cubit.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherInitial extends WeatherState {}

class WeatherSuccess extends WeatherState {
  final List<WeatherEntity> weather;

  const WeatherSuccess(this.weather);
}

class WeatherFailure extends WeatherState {
  final String errmessage;

  const WeatherFailure(this.errmessage);
}

class WeatherLoading extends WeatherState {}
