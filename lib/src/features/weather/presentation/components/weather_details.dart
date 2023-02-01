import 'package:flutter/material.dart';
import 'package:weather_app/src/core/theme/typography.dart';
import 'package:weather_app/src/features/weather/presentation/components/hourly_card.dart';
import 'package:weather_app/src/features/weather/presentation/components/weather_details_card.dart';

class WeatherDetails extends StatelessWidget {
  const WeatherDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 1.0,
      minChildSize: .5,
      expand: false,
      builder: (_, controller) => Column(
        children: [
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                'hourly forecast',
                style: TextStyles.body,
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 5),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: const <Widget>[
                HourlyCard(),
                HourlyCard(),
                HourlyCard(),
                HourlyCard(),
                HourlyCard(),
                HourlyCard(),
                HourlyCard(),
                HourlyCard(),
                HourlyCard(),
              ],
            ),
          ),
          Expanded(
            flex: 5,
            child: GridView.count(
              primary: false,
              padding: const EdgeInsets.all(2),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              children: const <Widget>[
                WeatherDetailsCard(
                  title: 'UV Index',
                  icon: Icons.sunny,
                  param: '4',
                  comment: 'Moderate',
                ),
                WeatherDetailsCard(
                  title: 'UV Index',
                  icon: Icons.sunny,
                  param: '4',
                  comment: 'Moderate',
                ),
                WeatherDetailsCard(
                  title: 'UV Index',
                  icon: Icons.sunny,
                  param: '4',
                  comment: 'Moderate',
                ),
                WeatherDetailsCard(
                  title: 'UV Index',
                  icon: Icons.sunny,
                  param: '4',
                  comment: 'Moderate',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
