import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(DicePage());
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int _leftDiceNumber;
  int _rightDiceNumber;
  int _rollTotal;

  Color _darkPrimaryColor = Color.fromARGB(255, 48, 63, 159);
  Color _lightPrimaryColor = Color.fromARGB(255, 197, 202, 233);
  Color _primaryColor = Color.fromARGB(255, 63, 81, 181);
  Color _textIconColor = Color.fromARGB(255, 255, 255, 255);
  Color _accentColor = Color.fromARGB(255, 255, 87, 34);
  Color _primaryText = Color.fromARGB(255, 33, 33, 33);
  Color _secondaryText = Color.fromARGB(255, 117, 117, 117);
  Color _dividerColor = Color.fromARGB(255, 189, 189, 189);

  void _roll() {
    setState(() {
      _leftDiceNumber = Random().nextInt(6) + 1;
      _rightDiceNumber = Random().nextInt(6) + 1;
      _rollTotal = _leftDiceNumber + _rightDiceNumber;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        top: false,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 5,
            title: Text('Dice Roll'),
            backgroundColor: _darkPrimaryColor,
          ),
          body: Column(
            children: <Widget>[
              Container(
                color: _primaryColor,
                height: 100,
                child: Center(
                  child: Text(
                    _rollTotal != null
                        ? 'You have rolled: $_rollTotal'
                        : 'You have not rolled yet.',
                    style: TextStyle(
                      color: _lightPrimaryColor,
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
                          ? Image.asset(
                              'assets/images/dice$_rightDiceNumber.png')
                          : Image.asset('assets/images/dice_roll456.png'),
                    ),
                  ],
                ),
              ),
            ],
          ),
          bottomNavigationBar: BottomAppBar(
            color: _darkPrimaryColor,
            shape: const CircularNotchedRectangle(),
            child: Container(
              height: 50,
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: _primaryColor,
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
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
        ),
      ),
    );
  }
}
