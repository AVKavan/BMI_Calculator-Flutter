import 'dart:ffi';

import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/resultPage.dart';
import 'package:flutter/material.dart';
import 'gender_icon.dart';
import 'reusable_card.dart';
import 'constants.dart';
import 'roundIconButton.dart';
import 'package:cool_alert/cool_alert.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

enum Gender {
  male,
  female;
}

const numtextStyle = TextStyle(
  fontSize: 60,
  color: Colors.white,
);

class _InputPageState extends State<InputPage> {
  Gender? genderChosen;
  int height = 170;
  int Wnum = 60;
  int age = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    pressFunc: () {
                      setState(() {
                        genderChosen = Gender.male;
                      });
                    },
                    colour: genderChosen == Gender.male
                        ? kCardColor
                        : kInactivecardColor,
                    cardChild: GenderIcon(Icons.man_rounded, 'MALE'),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    pressFunc: () {
                      setState(() {
                        genderChosen = Gender.female;
                      });
                    },
                    colour: genderChosen == Gender.female
                        ? kCardColor
                        : kInactivecardColor,
                    cardChild: GenderIcon(Icons.woman_rounded, 'FEMALE'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white70,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        '$height',
                        style: numtextStyle,
                      ),
                      Text(
                        'cm',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbColor: Color(0xFFEB1555),
                      activeTrackColor: Color(0xFFEB1555),
                      inactiveTrackColor: Colors.white,
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 16),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 25),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      max: 230,
                      min: 120,
                      onChanged: (double val) {
                        setState(() {
                          height = val.toInt();
                        });
                      },
                    ),
                  ),
                ],
              ),
              colour: kCardColor,
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: kCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          '$age',
                          style: TextStyle(fontSize: 50),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: Icons.remove,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            RoundIconButton(
                              icon: Icons.add,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          '$Wnum',
                          style: TextStyle(fontSize: 50),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                                icon: Icons.remove,
                                onPressed: () {
                                  setState(() {
                                    Wnum--;
                                  });
                                }),
                            SizedBox(
                              width: 20,
                            ),
                            RoundIconButton(
                                icon: Icons.add,
                                onPressed: () {
                                  setState(() {
                                    Wnum++;
                                  });
                                })
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: height, weight: Wnum);
              if (genderChosen == null) {
                CoolAlert.show(
                    context: context,
                    type: CoolAlertType.warning,
                    text: 'please select a gender before calculating BMI',
                    confirmBtnColor: kLastContColor,
                    flareAsset: 'assets/alert.png');
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Result(
                          BMI: calc.calculateBmi(),
                          result: calc.ResultText(),
                          suggest: calc.SuggestText());
                    },
                  ),
                );
              }
              ;
            },
            child: Container(
              child: Center(
                child: Text(
                  'CALCULATE BMI',
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
