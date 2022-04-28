import 'package:flutter/material.dart';
import 'constants.dart';

class TextStyles {
  static const TextStyle pokedexTextStyle = TextStyle(
    fontSize: Constants.pokedexFontSize,
    color: Colors.redAccent,
  );
  static const TextStyle nameTextStyle = TextStyle(
    color: Colors.amber,
  );
  static const TextStyle weightTextStyle = TextStyle(
    fontSize: Constants.attributesFontSize,
    color: Colors.yellow,
  );
  static const TextStyle heightTextStyle = TextStyle(
    fontSize: Constants.attributesFontSize,
    color: Colors.yellow,
  );
  static const TextStyle detailsNameTextStyle = TextStyle(
    color: Colors.black,
    decoration: TextDecoration.underline,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle detailsCaptureRateTextStyle = TextStyle(
    fontSize: Constants.detailsDataFontSize,
    color: Colors.indigo,
    backgroundColor: Colors.black26,
  );
  static const TextStyle detailsAgeTextStyle = TextStyle(
    fontSize: Constants.detailsDataFontSize,
    color: Colors.lime,
  );
  static const TextStyle detailsGeneralDataTextStyle = TextStyle(
    fontSize: Constants.detailsDataFontSize,
    color: Colors.orange,
  );
}
