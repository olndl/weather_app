import 'package:flutter/material.dart';
import 'package:weather_app/src/core/constants/interface.dart';
import 'package:weather_app/src/core/theme/colors_guide.dart';
import 'package:weather_app/src/core/theme/typography.dart';
import 'package:weather_app/src/gen/assets.gen.dart';

class EditText extends StatelessWidget {
  const EditText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return TextFormField(
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
    );
  }
}
