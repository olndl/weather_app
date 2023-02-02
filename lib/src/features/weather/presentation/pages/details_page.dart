import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/core/widgets/dialogs/error_dialog.dart';
import 'package:weather_app/src/core/widgets/loading_widget.dart';
import 'package:weather_app/src/features/weather/bloc/weather_cubit.dart';
import 'package:weather_app/src/features/weather/presentation/components/details_page_body.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      bloc: BlocProvider.of<WeatherCubit>(context),
      builder: (BuildContext context, WeatherState state) {
        if (state is WeatherLoading) {
          return const LoadingWidget();
        } else if (state is WeatherLoaded) {
          return DetailsPageBody(
            weather: state.weather,
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
