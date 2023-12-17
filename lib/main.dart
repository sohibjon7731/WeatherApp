import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/weather_bloc/weather_bloc.dart';
import 'package:weather/weather_repository.dart';

void main(List<String> args) {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherBloc(repository: WeatherRepository()),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: App(),
      ),
    );
  }
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, state) {
            switch (state.runtimeType) {
              case WeatherInitial:
                context.read<WeatherBloc>().add(WeatherStarted());
                return SizedBox();
              case WeatherLoading:
                return Center(child: CircularProgressIndicator());
              case WeatherSucces:
                final data = (state as WeatherSucces);
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      getProperIcon(data.degree),
                      size: 50,
                    ),
                    SizedBox(height: 15),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        data.location,
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        ' ${data.degree}°C',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                );
              default:
                return SizedBox();
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<WeatherBloc>().add(WeatherRefreshButtonPressed());
        },
        child: Icon(Icons.refresh),
      ),
    );
  }

  IconData getProperIcon(int degree) {
    if (degree > 15) {
      return Icons.sunny;
    } else if (degree < 15 && degree > 0) {
      return Icons.cloud;
    } else {
      return Icons.snowing;
    }
  }
}
