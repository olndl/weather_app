import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:weather_app/src/core/dimensions/adaptive_widget.dart';
import 'package:weather_app/src/core/localization/localization.dart';
import 'package:weather_app/src/core/theme/app_theme.dart';
import 'package:weather_app/src/di/injection_container.dart' as di;
import 'package:weather_app/src/features/presentation/bloc/weather_bloc.dart';
import 'package:weather_app/src/features/presentation/weather/pages/search_page.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => di.injector<WeatherBloc>(),
        ),
      ],
      child: AdaptiveWidget(
        builder: (context, orientation) {
          return MaterialApp(
            localizationsDelegates: const [
              Localization.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: Localization.supportedLocales,
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            home: const SearchPage(),
          );
        },
      ),
    );
  }
}
