import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/core/theme/colors_guide.dart';
import 'package:weather_app/src/core/theme/typography.dart';
import 'package:weather_app/src/core/utils/utils.dart';
import 'package:weather_app/src/core/widgets/dialogs/error_dialog.dart';
import 'package:weather_app/src/core/widgets/loading_widget.dart';
import 'package:weather_app/src/features/forecast/presentation/components/custom_card.dart';
import 'package:weather_app/src/features/weather/presentation/bloc/weather_cubit.dart';
import 'package:weather_app/src/features/weather/presentation/components/custom_scaffold.dart';

class ForecastPage extends StatelessWidget {
  const ForecastPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      bloc: BlocProvider.of<WeatherCubit>(context),
      builder: (BuildContext context, WeatherState state) {
        if (state is WeatherLoading) {
          return const LoadingWidget();
        } else if (state is WeatherLoaded) {
          final forecastAll = state.hourlyForecast;
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
                  'Forecast',
                  style: TextStyles.title1,
                ),
              ),
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  ColorsGuide.firstBackgroundColor,
                  ColorsGuide.secondBackgroundColor
                ],
              ),
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    // give the tab bar a height [can change hheight to preferred height]
                    Container(
                      height: 45,
                      decoration: BoxDecoration(
                        color: ColorsGuide.radial,
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
                              'on 3 days',
                              style: TextStyles.title2,
                            ),
                          ),
                          Tab(
                            child: Text(
                              'on 5 days',
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
                                    forecastListThreeDays[index].dt,),
                                mood: forecastListThreeDays[index]
                                    .weather
                                    .first
                                    .main,
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
                                    forecastListFiveDays[index].dt,),
                                mood: forecastListFiveDays[index]
                                    .weather
                                    .first
                                    .main,
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
        } else if (state is WeatherError) {
          ErrorDialog.showErrorDialog(context, state.msg);
          return SliverToBoxAdapter(child: Container());
        }
        return SliverToBoxAdapter(child: Container());
      },
    );
  }
}
