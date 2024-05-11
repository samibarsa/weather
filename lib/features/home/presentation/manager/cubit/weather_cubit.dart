import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather/features/home/domain/entities/weather_entity.dart';
import 'package:weather/features/home/domain/usecases/weather_use_case.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherUseCase weatherUseCase;
  WeatherCubit(this.weatherUseCase) : super(WeatherInitial());

  Future<void> getWeather(String cityName) async {
    emit(WeatherLoading());
    var result = await weatherUseCase.fetchData(cityName);

    result.fold((failure) => emit(WeatherFailure(failure.errmessage)),
        (weather) => emit(WeatherSuccess(weather)));
  }
}
