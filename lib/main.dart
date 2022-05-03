import 'package:flutter/material.dart';
import 'src/config/route/app_routes.dart';
import 'src/config/theme/app_themes.dart';
import 'src/core/util/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Constants.appTitle,
      theme: Themes.appTheme,
      initialRoute: Constants.homePageRoute,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
