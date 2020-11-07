import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app_hava_durm_provider/viewmodel/weather_view_model.dart';
import 'package:provider/provider.dart';

import 'fivedays_weather.dart';
import 'last_update.dart';
import 'location.dart';
import 'maxmin_temp.dart';
import 'pick_city.dart';
import 'weather_icon.dart';

class WeatherApp extends StatelessWidget {
  String pickedCity = "";
  WeatherVeiwModel _weatherViewModel;

  Completer<void> completer = Completer<void>();

  @override
  Widget build(BuildContext context) {
    _weatherViewModel = Provider.of<WeatherVeiwModel>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () async {
                pickedCity = await Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PickCity()));
                print(pickedCity);
                _weatherViewModel.getWeatherInfo(pickedCity);
                print(_weatherViewModel.weatherResult.title);
              })
        ],
        title: Text("Hava Durumu (Provider)"),
      ),
      body: Container(
        color: Colors.amberAccent.withOpacity(0.2),
        child: Center(
          child: (_weatherViewModel.state == WeatherState.WeatherLoadedState)
              ? buildListView(context)
              : (_weatherViewModel.state == WeatherState.WeatherLoadingState)
                  ? gettingWeatherInfo()
                  : (_weatherViewModel.state == WeatherState.WeatherErrorState)
                      ? getWeatherError()
                      : Text("Şehir Bilgisi Giriniz!",style: TextStyle(fontSize: 30),),
        ),
      ),
    );
  }

  Widget buildListView(BuildContext context) {
    completer.complete();
    completer = Completer<void>();
    return RefreshIndicator(
      onRefresh: () {
        _weatherViewModel.getRefreshedWeatherInfo(pickedCity);
        return completer.future;
      },
      child: ListView(
        shrinkWrap: true,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom :40.0),
            child: LocationWidget(_weatherViewModel.weatherResult),
          ),
          WeatherIconWidget(
              _weatherViewModel.weatherResult.consolidatedWeather[0]),
          MaxMinTempWidget(
              _weatherViewModel.weatherResult.consolidatedWeather[0]),
          Divider(
            height: 1,
            thickness: 1,
          ),
          FiveDaysWeather(_weatherViewModel.weatherResult.consolidatedWeather),
          Divider(
            height: 1,
            thickness: 1,
          ),
          LastUpdateWidget(_weatherViewModel.weatherResult.time.toLocal()),
        ],
      ),
    );
  }

  gettingWeatherInfo() {
    return CircularProgressIndicator();
  }

  getWeatherError() {
    return Text("Hava durumu getirilirken hata oluştu.");
  }
}
