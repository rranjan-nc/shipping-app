import 'dart:io';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:shipping_ui_app/widget_constants/colorz.dart';
import 'package:shipping_ui_app/widgets/complex_text.dart';

class Utility {
  // ignore: prefer_function_declarations_over_variables
  static final IconThemeData Function(dynamic context) appBarTheme =
      (context) => IconTheme.of(context).copyWith(
            color: Colors.black,
          );

  static PreferredSizeWidget appBar(BuildContext context) {
    return AppBar(
      iconTheme: appBarTheme.call(context),
      title: const ComplexText(
        text: "Shipping Api",
        color: Colors.black,
      ),
      backgroundColor: Colorz.compexDrawerCanvasColor,
    );
  }

  static bool isRunningOnWeb() {
    return kIsWeb;
  }

  static bool isAndroid() {
    return Platform.isAndroid;
  }
}
