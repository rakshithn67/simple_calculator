import 'package:flutter/material.dart';

class CalculatorProvider with ChangeNotifier {
  late TextEditingController _number1 = TextEditingController();
  late TextEditingController _number2 = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  late String _displayText = '';

  late String _result = '';

  TextEditingController get number1 => _number1;

  TextEditingController get number2 => _number2;

  String get displayText => _displayText;

  String get result => _result;

  GlobalKey<FormState> get formkey => _formKey;

  buttonClicked(
    String value,

  ) {
    print(value);

    int num1 = int.parse(_number1.text);
    int num2 = int.parse(_number2.text);
    print(num1);
    print(num2);
    if (value == '+') {
      _result = (num1 + num2).toString();
    } else if (value == '-') {
      _result = (num1 - num2).toString();
    } else if (value == 'x') {
      _result = (num1 * num2).toString();
    } else if (value == '/') {
      _result = (num1 ~/ num2).toString();
    }
    print(_result);
   notifyListeners();
  }

  doReset() {
    _displayText = '';
    _result = '';
    _number1 = TextEditingController();
    _number2 = TextEditingController();
    notifyListeners();
  }
}
