import 'package:flutter/material.dart';
import 'package:weather_app/src/core/constants/interface.dart';
import 'package:weather_app/src/core/extensions/extensions.dart';
import 'package:weather_app/src/core/theme/colors_guide.dart';
import 'package:weather_app/src/core/theme/typography.dart';
import 'package:weather_app/src/features/weather/presentation/components/custom_button.dart';
import 'package:weather_app/src/features/weather/presentation/pages/details_page.dart';
import 'package:weather_app/src/gen/assets.gen.dart';

class EditText extends StatelessWidget {
  const EditText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Column(
      children: [
        TextFormField(
          controller: controller,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          style: TextStyles.body,
          decoration: InputDecoration(
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
        CustomButton(
          title: Interface.approve,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const DetailsPage()),
            );
          },
        )
      ],
    );
  }
}
