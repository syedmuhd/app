import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  static const lightThemeFont = "ComicNeue";
  static const darkThemeFont = "Poppins";

  // colors
  static Color lightThemeColor = const Color.fromRGBO(19, 18, 23, 1);
  static Color darkThemeColor = Colors.yellow;
  static Color white = const Color.fromRGBO(250, 249, 254, 1);
  static Color black = Colors.black;

  // light theme
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: lightThemeColor,
    scaffoldBackgroundColor: white,
    useMaterial3: true,
    fontFamily: lightThemeFont,
    switchTheme: SwitchThemeData(
      thumbColor:
          MaterialStateProperty.resolveWith<Color>((states) => lightThemeColor),
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: white,
      scrolledUnderElevation: 0,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.w500,
        color: black,
        fontSize: 23, //20
      ),
      iconTheme: IconThemeData(color: lightThemeColor),
      elevation: 0,
      actionsIconTheme: IconThemeData(color: lightThemeColor),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: white,
        statusBarIconBrightness: Brightness.dark,
      ),
    ),
  );
}
