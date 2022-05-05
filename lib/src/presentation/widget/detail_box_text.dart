import 'package:flutter/material.dart';
import '../../core/util/constants.dart';
import '../../core/util/text_styles.dart';

class DetailBoxText extends StatelessWidget {
  const DetailBoxText({
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: Constants.detailsBoxPadding),
      child: Text(
        text,
        style: TextStyles.detailsAttributesTextStyle,
      ),
    );
  }
}
