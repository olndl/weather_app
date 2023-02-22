import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class Localization {
  Localization(this.locale);

  Locale locale;

  static Localization of(BuildContext context) {
    return Localizations.of<Localization>(context, Localization)!;
  }

  static const en = Locale('en', 'US');
  static const ru = Locale('ru', 'RUS');

  static const supportedLocales = [en, ru];

  static const LocalizationsDelegate<Localization> delegate =
      _LocalizationDelegate();

  late Map<String, String> _str;

  Future<bool> getLocalization() async {
    String jsonString = await rootBundle
        .loadString('lib/src/assets/i18n/${locale.languageCode}.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);

    _str = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });
    return true;
  }

  String get hint => _str['hint'] ?? '';

  String get confirm => _str['confirm'] ?? '';

  String get warning => _str['warning'] ?? '';

  String get msec => _str['msec'] ?? '';

  String get mmhg => _str['mmhg'] ?? '';

  String get feelsLike => _str['feelsLike'] ?? '';

  String get wind => _str['wind'] ?? '';

  String get sunrise => _str['sunrise'] ?? '';

  String get sunset => _str['sunset'] ?? '';

  String get pressure => _str['pressure'] ?? '';

  String get aqi => _str['aqi'] ?? '';

  String get forecast => _str['forecast'] ?? '';

  String get threeDays => _str['3days'] ?? '';

  String get fiveDays => _str['5days'] ?? '';

  String get N => _str['N'] ?? '';

  String get nE => _str['NE'] ?? '';

  String get E => _str['E'] ?? '';

  String get sE => _str['SE'] ?? '';

  String get S => _str['S'] ?? '';

  String get sW => _str['SW'] ?? '';

  String get W => _str['W'] ?? '';

  String get nW => _str['NW'] ?? '';

  String get pressureNorm => _str['pressureNorm'] ?? '';

  String get pressureNotNorm => _str['pressureNotNorm'] ?? '';

  String get feelsColder => _str['feelsColder'] ?? '';

  String get feelsWarmer => _str['feelsWarmer'] ?? '';

  String get feelsRelevant => _str['feelsRelevant'] ?? '';

  String get aiqLow => _str['aiqLow'] ?? '';

  String get aiqModerate => _str['aiqModerate'] ?? '';

  String get aiqHigh => _str['aiqHigh'] ?? '';

  String get aiqVeryHigh => _str['aiqVeryHigh'] ?? '';

  String get aiqNo => _str['aiqNo'] ?? '';

  String get wrong => _str['wrong'] ?? '';

  String get retry => _str['retry'] ?? '';
}

class _LocalizationDelegate extends LocalizationsDelegate<Localization> {
  const _LocalizationDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['ru', 'en'].contains(locale.languageCode);
  }

  @override
  Future<Localization> load(Locale locale) async {
    Localization localizations = Localization(locale);
    await localizations.getLocalization();
    return localizations;
  }

  @override
  bool shouldReload(_LocalizationDelegate old) => false;
}
