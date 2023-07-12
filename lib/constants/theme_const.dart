// theme for the app

import 'package:flutter/material.dart';

ThemeData themeData(BuildContext context) {
  return ThemeData(
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: const Color.fromARGB(255, 26, 25, 25),
      secondary: const Color.fromARGB(255, 144, 103, 198),
      tertiary: Colors.white,
      // tertiary:  const Color.fromARGB(255, 141, 134, 201),
    ),
    fontFamily: 'Inter',
    useMaterial3: true,
    // height of the font
  );
}

// COLOR PALLETE
// primary: Color.fromARGB(255, 206, 229, 242),
// secondary: Color.fromARGB(255, 172, 203, 225),
// tertiary: Color.fromARGB(255, 124, 152, 179),
// quaternary: Color.fromARGB(255, 99, 112, 129),
// quinary: Color.fromARGB(255, 83, 107, 120),