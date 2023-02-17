import 'package:flutter/material.dart';
import 'package:weather_app/src/core/extensions/extensions.dart';
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
          child: SizedBox(
            height: 45.percentOfHeight,
            width: 80.percentOfWidth,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Assets.lib.src.assets.svg.emptyState.svg(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
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
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      'Something was wrong',
                      style: TextStyles.body,
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Retry',
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
