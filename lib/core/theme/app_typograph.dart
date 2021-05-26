import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppTypograph {
  static TextStyle bodyText(BuildContext context) {
    return Theme.of(context).textTheme.bodyText1;
  }

  static TextStyle bodyTextBold(BuildContext context) {
    return Theme.of(context).textTheme.bodyText1.copyWith(
          fontWeight: FontWeight.w500,
        );
  }
}
