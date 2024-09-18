import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:weather_app_bloc/data/api/api_service.dart';
import 'package:weather_app_bloc/data/api/api_service_impl.dart';
import 'package:weather_app_bloc/data/remote/model/weather_model_response.dart';
import 'package:weather_app_bloc/weather_bloc/weather_event.dart';
import 'package:weather_app_bloc/weather_bloc/weather_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final ApiService _apiService = ApiServiceImpl();
  WeatherBloc() : super(WeatherInitialState()) {
    on<FetchWeatherEvent>((event, emit) => _fetchWeatherData(event, emit));
  }

  Future<void> _fetchWeatherData(FetchWeatherEvent event, Emitter<WeatherState> emit) async {
    try {
      emit(WeatherLoadingState());
      final response = await _apiService.getWeatherData(event.location, event.matericOrImperial);
      if (response.statusCode == 200) {
        WeatherResponse weatherResponse = WeatherResponse.fromJson(jsonDecode(response.body));
        emit(WeatherLoadedState(weatherResponse));
      } else if (response.statusCode == 404) {
        final data = jsonDecode(response.body);
        emit(WeatherLoadingFaliureState(data['message']));
      } else if (response.statusCode == 429) {
        emit(WeatherLoadingFaliureState('Too many attempts try again later...'));
      } else {
        emit(WeatherLoadingFaliureState('Server Error'));
      }
    } catch (e) {
      emit(WeatherLoadingFaliureState('Unable to fetch data'));
      debugPrint(e.toString());
    }
  }
}
