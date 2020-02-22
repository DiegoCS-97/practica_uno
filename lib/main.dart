import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/login/options.dart';
import 'package:practica_integradora_uno/utils/constants.dart';

import 'utils/constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: APP_TITLE,
      theme: _tCuppingTheme,
      home: Options(),
    );
  }
}

//Tema para app
final ThemeData _tCuppingTheme = _buildtCuppingTheme();

ThemeData _buildtCuppingTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    primaryColor: tCuppingBlue100,
    accentColor: tCuppingBrown50,
    buttonTheme: ButtonThemeData(
      buttonColor: tCuppingBrown50,
    ),
    scaffoldBackgroundColor: tCuppingWhite,
    textTheme: _buildCuppingTextTheme(base.textTheme),
    primaryTextTheme: _buildCuppingTextTheme(base.primaryTextTheme),
    accentTextTheme: _buildCuppingTextTheme(base.accentTextTheme),
  );
}

TextTheme _buildCuppingTextTheme(TextTheme base) {
  return base
      .copyWith(
        headline: base.headline.copyWith(
          fontWeight: FontWeight.w500,
        ),
        title: base.title.copyWith(fontSize: 18.0),
        caption: base.caption.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 14.0,
        ),
      )
      .apply(
        fontFamily: 'OpenSans',
      );
}


