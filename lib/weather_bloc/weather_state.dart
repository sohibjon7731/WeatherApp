// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'weather_bloc.dart';

sealed class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState{}

class WeatherSucces extends WeatherState {
  final int degree;
  final String location;
  WeatherSucces({
    required this.degree,
    required this.location,
  });
  
}

class WeatherFailure extends WeatherState {
  final String errorMessage;
  final num? errorCode;
  WeatherFailure({
    required this.errorMessage,
    this.errorCode,
  });
}
