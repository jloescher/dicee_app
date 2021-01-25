import 'package:dicee_app/globals.dart' as globals;
import 'package:dicee_app/screens/dice_page.dart';
import 'package:dicee_app/screens/settings_page.dart';
import 'package:flutter/material.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'Menu',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            decoration: BoxDecoration(
              color: globals.darkPrimaryColor,
            ),
          ),
          ListTile(
            leading: Icon(Icons.input),
            title: Text('Dice Roll'),
            onTap: () => {
              Navigator.pushNamed(
                context,
                DicePage.routeName,
              ),
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () => {
              Navigator.pushNamed(
                context,
                SettingsPage.routeName,
              )
            },
          ),
          ListTile(
            leading: Icon(Icons.border_color),
            title: Text('Feedback'),
            onTap: () => {Navigator.of(context).pop()},
          ),
        ],
      ),
    );
  }
}
