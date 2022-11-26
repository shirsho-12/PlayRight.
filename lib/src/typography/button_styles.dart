import 'package:flutter/material.dart';

import '../colors.dart';

class PlayRightButtonStyle {
  static ButtonStyle get enabled {
    return ButtonStyle(
      backgroundColor: MaterialStateProperty.all(PlayRightColors.accent),
      foregroundColor: MaterialStateProperty.all(PlayRightColors.white),
      elevation: MaterialStateProperty.all(0),
    );
  }

  static ButtonStyle get disabled {
    return ButtonStyle(
      backgroundColor: MaterialStateProperty.all(PlayRightColors.inactive),
      foregroundColor: MaterialStateProperty.all(PlayRightColors.white),
      elevation: MaterialStateProperty.all(0),
    );
  }
}
