import 'package:dicee_app/globals.dart' as globals;
import 'package:dicee_app/screens/components/nav_drawer.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  static const routeName = '/settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  int diceQuantity = 2;

  void decrementDiceQuantity() {
    setState(() {
      if (diceQuantity > 1) {
        diceQuantity--;
      } else {
        print('Sorry, minimum amount of dice.');
      }
    });
  }

  void incrementDiceQuantity() {
    setState(() {
      if (diceQuantity < 6) {
        diceQuantity++;
      } else {
        print('Sorry, max amount of dice.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: NavDrawer(),
      appBar: AppBar(
        elevation: 5,
        title: Text('Dice Roll'),
        backgroundColor: globals.darkPrimaryColor,
      ),
      body: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlatButton(
              onPressed: decrementDiceQuantity,
              child: Icon(Icons.remove),
            ),
            Text('$diceQuantity'),
            FlatButton(
              onPressed: incrementDiceQuantity,
              child: Icon(Icons.add),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: globals.darkPrimaryColor,
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 50,
        ),
      ),
    );
  }
}
