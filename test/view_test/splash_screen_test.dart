import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/src/presentation/view/splash_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lottie/lottie.dart';

void main() {
  testWidgets('Check existence of widgets in Splash Screen',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: SplashScreen(),
      ),
    );
    expect(find.byType(Text), findsOneWidget);
    expect(find.text('Pokemons'), findsOneWidget);
    expect(find.byType(Container), findsOneWidget);
    expect(find.byType(LottieBuilder), findsOneWidget);
  });
}
