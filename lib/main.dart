import 'package:dicee_app/screens/dice_page.dart';
import 'package:dicee_app/screens/settings_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(StartApp());

class StartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dice Roll',
      initialRoute: DicePage.routeName,
      routes: {
        DicePage.routeName: (context) => DicePage(),
        SettingsPage.routeName: (context) => SettingsPage(),
      },
    );
  }
}
