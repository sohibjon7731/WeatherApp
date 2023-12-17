import 'package:dio/dio.dart';
import 'package:weather/weather_model.dart';

class WeatherRepository {
  Future<Weather> getDegreeAndLocation() async {
    Dio dio = Dio();

    final response = await dio.get(
        "https://api.weatherapi.com/v1/current.json?q=Tashkent&key=cc96eae67a2d4de5856145229231512");

    await Future.delayed(const Duration(seconds: 3));

    return Weather.fromJson(response.data);
  }
}
