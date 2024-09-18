import 'dart:convert';

WeatherRequest weatherRequestFromJson(String str) => WeatherRequest.fromJson(json.decode(str));

String weatherRequestToJson(WeatherRequest data) => json.encode(data.toJson());

class WeatherRequest {
  final String? q;
  final String? appid;
  final String? units;

  WeatherRequest({
    this.q,
    this.appid,
    this.units,
  });

  factory WeatherRequest.fromJson(Map<String, dynamic> json) => WeatherRequest(
        q: json["q"],
        appid: json["appid"],
        units: json["units"],
      );

  Map<String, dynamic> toJson() => {
        "q": q,
        "appid": appid,
        "units": units,
      };
}
