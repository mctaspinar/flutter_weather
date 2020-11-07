
import 'package:flutter_app_hava_durm_provider/viewmodel/weather_view_model.dart';
import 'package:get_it/get_it.dart';

import 'data/weather_api.dart';
import 'data/weather_repository.dart';

GetIt locator = GetIt.instance;

void setupLocator(){
  locator.registerLazySingleton(() => WeatherRepo());
  locator.registerLazySingleton(() => WeatherApiClient());
  locator.registerFactory(() => WeatherVeiwModel());
}