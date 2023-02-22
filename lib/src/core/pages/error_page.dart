import 'package:flutter/material.dart';
import 'package:weather_app/src/core/extensions/extensions.dart';
import 'package:weather_app/src/core/localization/localization.dart';
import 'package:weather_app/src/core/theme/colors_guide.dart';
import 'package:weather_app/src/core/theme/typography.dart';
import 'package:weather_app/src/features/presentation/weather/components/custom_scaffold.dart';
import 'package:weather_app/src/features/presentation/weather/pages/search_page.dart';
import 'package:weather_app/src/gen/assets.gen.dart';

class ErrorPage extends StatelessWidget {
  final String errorMsg;

  const ErrorPage({Key? key, required this.errorMsg}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Center(
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: ColorsGuide.primary, width: .3),
            borderRadius: BorderRadius.circular(40),
          ),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 10.percentOfWidth,
            ),
            height: 50.percentOfHeight,
            width: 80.percentOfWidth,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 15.percentOfHeight,
                  child: Assets.lib.src.assets.svg.emptyState.svg(),
                ),
                Padding(
                  padding: EdgeInsets.all(2.percentOfWidth),
                  child: Text(
                    'Oops!',
                    style: TextStyles.body.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    backgroundColor:
                        MaterialStateProperty.all(ColorsGuide.solid),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(1.percentOfWidth),
                    child: Text(
                      Localization.of(context).wrong,
                      style: TextStyles.body,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        behavior: SnackBarBehavior.floating,
                        elevation: 0,
                        backgroundColor: Colors.transparent,
                        margin: EdgeInsets.only(bottom: 10.percentOfHeight),
                        content: Container(
                          height: 10.percentOfHeight,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: ColorsGuide.primary.withOpacity(.7),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
                          ),
                          child: Center(
                            child: Text(
                              errorMsg,
                              textAlign: TextAlign.center,
                              style: TextStyles.headline
                                  .copyWith(color: ColorsGuide.darkSolid),
                            ),
                          ),
                        ),
                        dismissDirection: DismissDirection.none,
                      ),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        Localization.of(context).retry,
                        style: TextStyles.callout.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SearchPage(),
                            ),
                          );
                        },
                        icon: Assets.lib.src.assets.svg.hover.svg(
                          colorFilter: ColorFilter.mode(
                            ColorsGuide.darkSolid,
                            BlendMode.srcIn,
                          ),
                          width: 60,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
