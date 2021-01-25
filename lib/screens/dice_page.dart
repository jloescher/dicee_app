import 'dart:math';

import 'package:dicee_app/globals.dart' as globals;
import 'package:dicee_app/screens/components/nav_drawer.dart';
import 'package:flutter/material.dart';

class DicePage extends StatefulWidget {
  static const routeName = '/';

  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int _leftDiceNumber;
  int _rightDiceNumber;
  int _rollTotal;

  void _roll() {
    setState(() {
      _leftDiceNumber = Random().nextInt(6) + 1;
      _rightDiceNumber = Random().nextInt(6) + 1;
      _rollTotal = _leftDiceNumber + _rightDiceNumber;
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
      body: Column(
        children: <Widget>[
          Container(
            color: globals.primaryColor,
            height: 100,
            child: Center(
              child: Text(
                _rollTotal != null
                    ? 'You have rolled: $_rollTotal'
                    : 'You have not rolled yet.',
                style: TextStyle(
                  color: globals.lightPrimaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            child: Wrap(
              spacing: 8.0,
              runSpacing: 4.0,
              direction: Axis.horizontal,
              crossAxisAlignment: WrapCrossAlignment.center,
              alignment: WrapAlignment.center,
              runAlignment: WrapAlignment.center,
              children: <Widget>[
                Container(
                  height: 200,
                  width: 200,
                  child: _leftDiceNumber != null
                      ? Image.asset(
                          'assets/images/dice$_leftDiceNumber.png',
                        )
                      : Image.asset(
                          'assets/images/dice_roll123.png',
                        ),
                ),
                Container(
                  height: 200,
                  width: 200,
                  child: _rightDiceNumber != null
                      ? Image.asset('assets/images/dice$_rightDiceNumber.png')
                      : Image.asset('assets/images/dice_roll456.png'),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: globals.darkPrimaryColor,
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 50,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: globals.primaryColor,
        onPressed: _roll,
        tooltip: 'Roll Dice',
        heroTag: Text('Roll Dice'),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            'assets/images/dice_roll456.png',
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
