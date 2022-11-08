import 'dart:math';

class CalculatorBrain {
  int height;
  int weight;
  double _bmi = 20.7;

  CalculatorBrain({required this.height, required this.weight});

  String calculateBmi() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String ResultText() {
    if (_bmi >= 25)
      return 'Over Weight';
    else if (_bmi > 18.5)
      return 'Normal';
    else
      return 'Under Weight';
  }

  String SuggestText() {
    if (_bmi >= 25)
      return 'You have put on more weight than required, so time to hit Gym!';
    else if (_bmi > 18.5)
      return 'You have normal weight, Keep it up!';
    else
      return 'Oops, seems like you have not much weight, eat more and gain weight!';
  }
}
