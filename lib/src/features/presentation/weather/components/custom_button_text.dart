import 'package:flutter/material.dart';
import 'package:weather_app/src/core/theme/typography.dart';

class CustomButtonText extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;

  const CustomButtonText({Key? key, required this.title, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          title,
          style: TextStyles.callout,
        ),
      ),
    );
  }
}
