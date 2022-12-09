import 'package:flutter/material.dart' show Color;
import 'package:instagram_clone_kamranhccp/extensions/string/remove_all.dart';

// convert #????? or 0x????? to Color
extension HtmlColorToCode on String {
  Color HtmlColorToColor() => Color(
        int.parse(
          removeAll(['#', '0x']).padLeft(8, 'ff'),
          radix: 16,
        ),
      );
}
