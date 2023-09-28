import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData DarkThem = ThemeData(
  inputDecorationTheme: InputDecorationTheme(
      prefixIconColor: Colors.pink,
      prefixStyle: TextStyle(color: Colors.pink),
      hintStyle: TextStyle(color: HexColor('#9E18A7')),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        borderSide: BorderSide(
          style: BorderStyle.solid,
          color: HexColor('#9E18A7'),
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        borderSide: BorderSide(
          style: BorderStyle.solid,
          color: HexColor('#9E18A7'),
        ),
      )),
  primarySwatch: Colors.pink,
  scaffoldBackgroundColor: HexColor('#1A031B'),
  appBarTheme: AppBarTheme(
    actionsIconTheme: IconThemeData(color: HexColor('#9E18A7'), size: 30.0),
    backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: HexColor('#1A031B'),
      statusBarIconBrightness: Brightness.light,
    ),
    backgroundColor: HexColor('#1A031B'),
    elevation: 0.0,
    titleTextStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 30.0,
        color: HexColor('#9E18A7')),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.amber,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      unselectedItemColor: HexColor('#9E18A7'),
      type: BottomNavigationBarType.fixed,
      selectedItemColor: HexColor('EC81F3'),
      backgroundColor: HexColor('#1A031B'),
      elevation: 40.0),
  textTheme: TextTheme(
    headlineSmall: TextStyle(
        color: HexColor('#9E18A7'),
        fontSize: 20.0,
        fontWeight: FontWeight.w600),
    headlineMedium: TextStyle(
        color: HexColor('FAB2FF'), fontSize: 20.0, fontWeight: FontWeight.w600),
  ),
);
ThemeData LightThem = ThemeData(
  primarySwatch: Colors.amber,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    actionsIconTheme: IconThemeData(color: Colors.black, size: 30.0),
    backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.amber,
      statusBarIconBrightness: Brightness.dark,
    ),
    backgroundColor: Colors.white,
    elevation: 0.0,
    titleTextStyle: TextStyle(
        fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.black),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.amber,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.amber,
      backgroundColor: Colors.white,
      elevation: 40.0),
  textTheme: TextTheme(
    headlineSmall: TextStyle(
        color: HexColor('080808'), fontSize: 20.0, fontWeight: FontWeight.w600),
    headlineMedium: TextStyle(
        color: HexColor('858484'), fontSize: 20.0, fontWeight: FontWeight.w600),
  ),
  inputDecorationTheme: InputDecorationTheme(
    prefixIconColor: Colors.amber,
  ),
);
