import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colorz.dart';

final TextStyle kPageTitleStyle = GoogleFonts.roboto(
  fontSize: 16.0,
  fontWeight: FontWeight.w500,
  color: Colorz.heading1,
);

final TextStyle kPageTitleBoldStyle = GoogleFonts.roboto(
  fontSize: 18.0,
  fontWeight: FontWeight.bold,
);

final TextStyle formHeaderStyle = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.underline);

final TextStyle clientHeaderTitleStyle =
    TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold);

final TextStyle tableTitleStyle = GoogleFonts.roboto(
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
    color: Colorz.heading1,
    letterSpacing: 0.05);

final TextStyle tableTitleStyleBold = GoogleFonts.roboto(
    fontSize: 15.0,
    fontWeight: FontWeight.bold,
    color: Colorz.heading1,
    letterSpacing: 0.05);

final TextStyle tickerTitleStyle =
    TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold, color: Colors.green);

final TextStyle linkStyle = TextStyle(color: Colors.blue);

final TextStyle fadeStyle = TextStyle(fontSize: 12, color: Colors.black26);

final TextStyle ansTextStyle = TextStyle(fontSize: 12, color: Colors.black);
final TextStyle missingTextStyle = TextStyle(fontSize: 12, color: Colors.red);

final InputDecoration Function(
        dynamic label, dynamic hint, bool errorFlag, String errorMessage)
    textFieldDecoration =
    (label, hint, errorFlag, errorMessage) => InputDecoration(
          labelText: label,
          focusedBorder: InputBorder.none,
          hintText: hint,
          errorStyle: errorFlag != null && errorFlag
              ? const TextStyle(
                  fontSize: 13.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.red,
                )
              : null,
          errorText: errorFlag ? "$errorMessage" : null,
          contentPadding: EdgeInsets.all(0.0),
        );
