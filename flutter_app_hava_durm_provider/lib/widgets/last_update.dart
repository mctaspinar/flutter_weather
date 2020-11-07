import 'package:flutter/material.dart';
import 'package:flutter_app_hava_durm_provider/models/weather.dart';
import 'package:flutter_app_hava_durm_provider/viewmodel/weather_view_model.dart';
import 'package:provider/provider.dart';

class LastUpdateWidget extends StatelessWidget {
  DateTime local;
  LastUpdateWidget(this.local);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Son Güncelleme " + TimeOfDay.fromDateTime(local).format(context),
            style: TextStyle(fontSize: 14),
          ),
        ));
  }
}
