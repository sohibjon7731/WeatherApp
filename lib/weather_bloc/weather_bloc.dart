import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/weather_repository.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository _repository;
  WeatherBloc({required WeatherRepository repository})
      : _repository = repository,
        super(WeatherInitial()) {
    on<WeatherStarted>((event, emit) async {
      emit(WeatherLoading());
      try {
        final data = await _repository.getDegreeAndLocation();

        emit(WeatherSucces(
            degree: data.current.tempC, location: data.location.name));
      } catch (e) {
        emit(WeatherFailure(errorMessage: "$e", errorCode: null));
      }
    });
    on<WeatherRefreshButtonPressed>((event, emit) {
      add(WeatherStarted());
    });
  }
}
