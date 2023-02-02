import 'dart:async';

import 'package:flutter/material.dart';
import 'package:weather_app/src/app/weather_app.dart';
import 'package:weather_app/src/core/errors/logger.dart';
import 'package:weather_app/src/di/injection_container.dart' as di;

void main() {
  runZonedGuarded(
    () async {
      await _initialiseApp();
      runApp(const WeatherApp());
    },
    (error, stack) => logger.info(stack),
  );
}

_initialiseApp() async {
  initLogger();
  logger.info('Initializing dependencies...');
  await di.init();
}
