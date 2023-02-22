import 'package:flutter/material.dart';
import 'package:weather_app/src/core/localization/localization.dart';
import 'package:weather_app/src/core/theme/colors_guide.dart';
import 'package:weather_app/src/core/theme/typography.dart';
import 'package:weather_app/src/core/utils/utils.dart';
import 'package:weather_app/src/features/domain/models/hourly_forecast.dart';
import 'package:weather_app/src/features/presentation/forecast/components/custom_card.dart';
import 'package:weather_app/src/features/presentation/weather/components/custom_scaffold.dart';

class ForecastPageBody extends StatelessWidget {
  final HourlyForecast forecastAll;

  const ForecastPageBody({Key? key, required this.forecastAll})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final forecastListThreeDays = Utils.mergeSort(
      [forecastAll.list[4], forecastAll.list[12], forecastAll.list[20]],
    );
    final forecastListFiveDays = Utils.mergeSort(
      [
        forecastAll.list[4],
        forecastAll.list[12],
        forecastAll.list[20],
        forecastAll.list[28],
        forecastAll.list[36]
      ],
    );
    return DefaultTabController(
      length: 2,
      child: CustomScaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            Localization.of(context).forecast,
            style: TextStyles.title1,
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: 45,
                decoration: BoxDecoration(
                  color: ColorsGuide.radial.withOpacity(.5),
                  borderRadius: BorderRadius.circular(
                    25.0,
                  ),
                ),
                child: TabBar(
                  // give the indicator a decoration (color and border radius)
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      25.0,
                    ),
                    color: ColorsGuide.lightSolid,
                  ),
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.black,
                  tabs: [
                    Tab(
                      child: Text(
                        Localization.of(context).threeDays,
                        style: TextStyles.title2,
                      ),
                    ),
                    Tab(
                      child: Text(
                        Localization.of(context).fiveDays,
                        style: TextStyles.title2,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    ListView.builder(
                      itemCount: forecastListThreeDays.length,
                      itemBuilder: (BuildContext context, int index) {
                        return CustomCard(
                          temp:
                              '${forecastListThreeDays[index].main.temp.round()}',
                          wind:
                              '${forecastListThreeDays[index].wind.speed.round()}',
                          humidity:
                              '${forecastListThreeDays[index].main.humidity}',
                          date: Utils.toDateTimeYME(
                            forecastListThreeDays[index].dt,
                          ),
                          mood: forecastListThreeDays[index].weather.first.main,
                          description: forecastListThreeDays[index]
                              .weather
                              .first
                              .description,
                        );
                      },
                    ),
                    ListView.builder(
                      itemCount: forecastListFiveDays.length,
                      itemBuilder: (BuildContext context, int index) {
                        return CustomCard(
                          temp:
                              '${forecastListFiveDays[index].main.temp.round()}',
                          wind:
                              '${forecastListFiveDays[index].wind.speed.round()}',
                          humidity:
                              '${forecastListFiveDays[index].main.humidity}',
                          date: Utils.toDateTimeYME(
                            forecastListFiveDays[index].dt,
                          ),
                          mood: forecastListFiveDays[index].weather.first.main,
                          description: forecastListFiveDays[index]
                              .weather
                              .first
                              .description,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
