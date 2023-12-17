part of 'weather_bloc.dart';

sealed class WeatherEvent {}

class WeatherStarted extends WeatherEvent {}

class WeatherRefreshButtonPressed extends WeatherEvent{}
