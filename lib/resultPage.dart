import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'reusable_card.dart';

class Result extends StatelessWidget {
  final String BMI;
  final String result;
  final String suggest;

  Result({required this.BMI, required this.result, required this.suggest});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                alignment: Alignment.bottomCenter,
                child: Text(
                  "Your Result ",
                  style: TextStyle(
                    fontSize: 40,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    result,
                    style: kResultTextStyle,
                  ),
                  Text(
                    BMI,
                    style: kBMINumTextStyle,
                  ),
                  Text(
                    suggest,
                    textAlign: TextAlign.center,
                    style: kBMISuggestionTextStyle,
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              child: Center(
                child: Text(
                  'Recalculate BMI',
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ),
              color: kLastContColor,
              height: kLastContHeight,
              margin: EdgeInsets.only(top: 5),
              width: double.infinity,
            ),
          ),
        ],
      ),
    );
  }
}
