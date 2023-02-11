import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:weather_app/src/core/dimensions/adaptive_widget.dart';
import 'package:weather_app/src/core/theme/app_theme.dart';
import 'package:weather_app/src/di/injection_container.dart' as di;
import 'package:weather_app/src/features/weather/presentation/bloc/weather_cubit.dart';
import 'package:weather_app/src/features/weather/presentation/pages/search_page.dart';
import 'package:weather_app/src/core/localization/l10n/s.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => di.injector<WeatherCubit>(),
        ),
      ],
      child: AdaptiveWidget(
        builder: (context, orientation) {
          return MaterialApp(
            localizationsDelegates:  const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.supportedLocales,
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            home: const SearchPage(),
          );
        },
      ),
    );
  }
}
