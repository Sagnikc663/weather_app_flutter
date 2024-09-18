import 'package:http/http.dart';

abstract class ApiService {
  Future<Response> getWeatherData(String location, String matericOrImperial);
}
