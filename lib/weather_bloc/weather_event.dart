abstract class WeatherEvent {}

class FetchWeatherEvent extends WeatherEvent {
  final String location;
  final String matericOrImperial;

  FetchWeatherEvent(this.location, this.matericOrImperial);
}
