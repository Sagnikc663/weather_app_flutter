//import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:weather_app_bloc/constants/remote_urls.dart';
import 'package:weather_app_bloc/constants/weather_constants.dart';
import 'package:weather_app_bloc/data/api/api_service.dart';
import 'package:weather_app_bloc/data/remote/model/weather_model_request.dart';

class ApiServiceImpl extends ApiService {
  @override
  Future<Response> getWeatherData(String location, String matericOrImperial) async {
    WeatherRequest request = WeatherRequest(
      appid: WeatherConstants.apiKey,
      q: location,
      units: matericOrImperial,
    );
    //debugPrint('#Request ${request.}');
    final response = await get(Uri.https(RemoteUrls.baseUrl, RemoteUrls.endPoint, request.toJson()));

    return response;
  }
}
