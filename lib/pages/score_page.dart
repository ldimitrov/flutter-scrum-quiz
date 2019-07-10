import 'package:flutter/material.dart';
import './landing_page.dart';

class ScoreBoardPage extends StatelessWidget {
  final int _score;
  final int _totalQuestions;

  ScoreBoardPage(this._score, this._totalQuestions);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.blueAccent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Your score: ",
            style: TextStyle(
                color: Colors.white,
                fontSize: 50.0,
                fontWeight: FontWeight.bold),
          ),
          Text(_score.toString() + "/" + _totalQuestions.toString(),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 35.0,
                  fontWeight: FontWeight.bold)),
          IconButton(
            icon: Icon(Icons.arrow_right),
            color: Colors.white,
            iconSize: 50.0,
            onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                    builder: (BuildContext context) => LandingPage()),
                (Route<dynamic> route) => false),
          )
        ],
      ),
    );
  }
}
