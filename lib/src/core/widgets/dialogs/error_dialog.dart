import 'package:flutter/material.dart';
import 'package:weather_app/src/core/constants/interface.dart';
import 'package:weather_app/src/core/extensions/extensions.dart';
import 'package:weather_app/src/core/theme/colors_guide.dart';
import 'package:weather_app/src/core/theme/typography.dart';

class ErrorDialog extends StatelessWidget {
  final String mainText;

  const ErrorDialog({Key? key, required this.mainText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorsGuide.primary,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Container(
              padding: EdgeInsets.all(5.percentOfWidth),
              child: Icon(
                Icons.crisis_alert,
                color: ColorsGuide.secondary,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.percentOfHeight),
            child: Text(
              mainText,
              style: TextStyles.body,
            ),
          ),
          SizedBox(
            height: 1.percentOfHeight,
          ),
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 5.percentOfHeight),
              decoration: BoxDecoration(
                color: ColorsGuide.primary,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    Interface.okButton,
                    style: TextStyles.body.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Future showErrorDialog(BuildContext context, String text) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.only(top: 1.percentOfHeight),
          content: ErrorDialog(
            mainText: text,
          ),
        );
      },
    );
  }
}
