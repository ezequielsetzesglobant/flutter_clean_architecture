import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../core/util/constants.dart';
import '../../core/util/text_styles.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(Constants.splashScreenPadding),
                child: Container(
                  height: Constants.splashScreenGifHeight,
                  width: Constants.splashScreenGifWidth,
                  child: Lottie.asset(Constants.splashScreenGif),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(Constants.splashScreenPadding),
                child: Text(
                  Constants.splashScreenTitle,
                  style: TextStyles.splashScreenTitleTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
