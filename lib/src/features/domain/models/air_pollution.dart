import 'package:freezed_annotation/freezed_annotation.dart';

part 'air_pollution.freezed.dart';
part 'air_pollution.g.dart';

@freezed
class AirPollution with _$AirPollution {
  const factory AirPollution({
    CoordCity? coord,
    List<Coeffs>? list,
  }) = _AirPollution;

  factory AirPollution.fromJson(Map<String, dynamic> json) =>
      _$AirPollutionFromJson(json);
}

@freezed
class CoordCity with _$CoordCity {
  const factory CoordCity({
    int? lon,
    int? lat,
  }) = _CoordCity;

  factory CoordCity.fromJson(Map<String, dynamic> json) =>
      _$CoordCityFromJson(json);
}

@freezed
class Coeffs with _$Coeffs {
  const factory Coeffs({
    int? dt,
    MainCoeff? main,
  }) = _Coeffs;

  factory Coeffs.fromJson(Map<String, dynamic> json) => _$CoeffsFromJson(json);
}

@freezed
class MainCoeff with _$MainCoeff {
  const factory MainCoeff({
    int? aqi,
  }) = _MainCoeff;

  factory MainCoeff.fromJson(Map<String, dynamic> json) =>
      _$MainCoeffFromJson(json);
}
