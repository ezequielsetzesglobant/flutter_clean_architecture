import 'package:flutter/material.dart';
import 'colors_constants.dart';
import 'constants.dart';

class TextStyles {
  static const TextStyle noSuccessMessageTextStyle = TextStyle(
    fontSize: Constants.noSuccessMessageFontSize,
    color: Colors.redAccent,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle cardNameTextStyle = TextStyle(
    color: ColorsConstants.cardNameColor,
  );
  static const TextStyle cardAttributesTextStyle = TextStyle(
    fontSize: Constants.cardAttributesFontSize,
    color: ColorsConstants.cardAttributesColor,
  );
  static const TextStyle detailsNameTextStyle = TextStyle(
    color: ColorsConstants.detailsTextColor,
    decoration: TextDecoration.underline,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle detailsWeightAndHeightTextStyle = TextStyle(
    fontSize: Constants.detailsWeightAndHeightFontSize,
    color: ColorsConstants.detailsTextColor,
  );
  static const TextStyle detailsAttributesTextStyle = TextStyle(
    fontSize: Constants.detailsAttributesFontSize,
    color: ColorsConstants.detailsTextColor,
  );
  static const TextStyle detailsDescriptionTitleTextStyle = TextStyle(
    fontSize: Constants.detailsDescriptionTitleFontSize,
    color: ColorsConstants.detailsTextColor,
    decoration: TextDecoration.underline,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle detailsDescriptionTextStyle = TextStyle(
    fontSize: Constants.detailsDescriptionFontSize,
    color: ColorsConstants.detailsTextColor,
    letterSpacing: Constants.detailsDescriptionLetterSpacing,
    wordSpacing: Constants.detailsDescriptionWordSpacing,
  );
  static const TextStyle splashScreenTitleTextStyle = TextStyle(
    fontSize: Constants.splashScreenTitleFontSize,
    color: Colors.red,
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.italic,
  );
}
