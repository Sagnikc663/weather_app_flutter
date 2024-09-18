import 'package:weather_app_bloc/data/remote/model/weather_model_response.dart';

abstract class WeatherState {}

class WeatherInitialState extends WeatherState {}

class WeatherLoadingState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  final WeatherResponse weatherResponse;

  WeatherLoadedState(this.weatherResponse);
}

class WeatherLoadingFaliureState extends WeatherState {
  final String error;

  WeatherLoadingFaliureState(this.error);
}
