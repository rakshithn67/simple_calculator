import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  var number1 = TextEditingController();
  var number2 = TextEditingController();
  String result = '';

  buttonClicked(String textValue) {
    if (textValue == '+') {
      return result = (number1.text + number2.text).toString();
    } else if (textValue == '-') {
      return result = (number1.text + number2.text).toString();
    }
    Widget myButton(String value) {
      return ElevatedButton(
          onPressed: () {
            buttonClicked(value);
          },
          child: Text(value));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Simple Calculator'), centerTitle: true),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: const Text('Result :',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 5),
              child: TextField(
                controller: number1.text,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    labelText: 'First Number',
                    hintText: 'Enter the number'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 5),
              child: TextField(
                controller: number2,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    labelText: 'Second Number',
                    hintText: 'Enter the number'),
              ),
            ),
            Row(
              children: [
                Expanded(child: myButton('+')),
                Container(width: 5),
                Expanded(child: myButton('-')),
              ],
            ),
            Row(
              children: [
                Expanded(child: myButton('x')),
                Container(width: 5),
                Expanded(child: myButton('/'))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
