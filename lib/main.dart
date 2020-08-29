import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Center(
            child: Text('Tap on Dice or Button'),
          ),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  State createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  Random _random = Random();
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: FlatButton(
                  color: Colors.transparent,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: Image.asset('images/dice$leftDiceNumber.png'),
                  onPressed: () {
                    setState(() {
                      setNewDice();
                    });
                  },
                ),
              ),
              Expanded(
                child: FlatButton(
                  color: Colors.transparent,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: Image.asset('images/dice$rightDiceNumber.png'),
                  onPressed: () {
                    setState(() {
                      setNewDice();
                    });
                  },
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 100),
            child: RaisedButton(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
                side: BorderSide(color: Colors.red),
              ),
              color: Colors.white,
              child: Text(
                'THROW',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 3,
                  fontSize: 50,
                ),
              ),
              onPressed: () {
                setState(() {
                  setNewDice();
                });
              },
            ),
          )
        ],
      ),
    );
  }

  void setNewDice() {
    rightDiceNumber = _random.nextInt(6) + 1;
    leftDiceNumber = _random.nextInt(6) + 1;
    print('Dice 1 is now $leftDiceNumber');
    print('Dice 2 is now $rightDiceNumber');
  }
}
