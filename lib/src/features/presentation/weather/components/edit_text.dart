import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/core/constants/interface.dart';
import 'package:weather_app/src/core/extensions/extensions.dart';
import 'package:weather_app/src/core/theme/colors_guide.dart';
import 'package:weather_app/src/core/theme/typography.dart';
import 'package:weather_app/src/features/presentation/weather/components/custom_button_text.dart';
import 'package:weather_app/src/gen/assets.gen.dart';
import 'package:weather_app/src/features/presentation/bloc/weather_bloc.dart';
import 'package:weather_app/src/features/presentation/bloc/weather_event.dart';
import 'package:weather_app/src/features/presentation/weather/pages/details_page.dart';

class EditText extends StatelessWidget {
  const EditText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController cityController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    final weatherBloc = BlocProvider.of<WeatherBloc>(context);
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            controller: cityController,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            style: TextStyles.body,
            decoration: InputDecoration(
              errorStyle: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Assets.lib.src.assets.svg.magnifyingglass.svg(),
              ),
              hintStyle: TextStyle(color: ColorsGuide.primary),
              hintText: Interface.hint,
            ),
          ),
          SizedBox(
            height: 2.percentOfHeight,
          ),
          CustomButtonText(
            title: Interface.approve,
            onPressed: () {
              if (formKey.currentState!.validate()) {
                weatherBloc.add(
                  FetchWeather(
                    cityController.text.trim().toLowerCase(),
                  ),
                );
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DetailsPage()),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
