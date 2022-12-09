import 'package:flutter/foundation.dart' show immutable;
import 'package:flutter/material.dart' show Colors;
import 'package:instagram_clone_kamranhccp/extensions/string/as_html_color_to_code.dart';

@immutable
class AppColors {
  static final loginButtonColor = '#cfc9c2'.HtmlColorToColor();
  static const loginButtonTextColor = Colors.black;
  static final googleColor = '#4285F4'.HtmlColorToColor();
  static final facebookColor = '#3b5998'.HtmlColorToColor();
  const AppColors._();
}
