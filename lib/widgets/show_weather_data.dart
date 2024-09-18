import 'package:flutter/material.dart';
import 'package:weather_app_bloc/constants/weather_constants.dart';
import 'package:weather_app_bloc/weather_bloc/weather_state.dart';

class ShowWeatherData extends StatelessWidget {
  final WeatherLoadedState state;
  final bool centigrateOrFarenhite;
  const ShowWeatherData({required this.state, required this.centigrateOrFarenhite, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '${WeatherConstants.todaysWeather} ${state.weatherResponse.name}, ${state.weatherResponse.sys?.country}',
            style: WeatherConstants.titleName,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 5),
                child: Text(
                  'Temperature: ${state.weatherResponse.main?.temp?.ceil().toString()} ${centiOrFarenText(centigrateOrFarenhite)}, ${state.weatherResponse.weatherDetails?[0].main}',
                  style: WeatherConstants.textStyleUi,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'Humidity: ${state.weatherResponse.main?.humidity.toString()}%',
                style: WeatherConstants.textStyleUi,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'Minimum temperature: ${state.weatherResponse.main?.tempMin?.ceil().toString()} ${centiOrFarenText(centigrateOrFarenhite)}',
                style: WeatherConstants.textStyleUi,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'Maximum temperature: ${state.weatherResponse.main?.tempMax?.ceil().toString()} ${centiOrFarenText(centigrateOrFarenhite)}',
                style: WeatherConstants.textStyleUi,
              ),
              const SizedBox(
                height: 5,
              ),
            ],
          ),
          Text(
            'Clouds: ${state.weatherResponse.clouds?.all}%',
            style: WeatherConstants.textStyleUi,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            'Wind speed: ${state.weatherResponse.wind?.speed} m/s',
            style: WeatherConstants.textStyleUi,
          ),
        ],
      ),
    );
  }
}
