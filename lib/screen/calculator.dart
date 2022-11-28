import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sixth_project_part/providers/calculator_provider.dart';

class Calculator extends StatelessWidget {
  const Calculator({Key? key}) : super(key: key);

  Widget myButton(String value, CalculatorProvider calculatorData) {
    return ElevatedButton(
        onPressed: () {
          if (calculatorData.formkey.currentState!.validate()) {
            calculatorData.buttonClicked(
              value,
            );
          }
        },
        child: Text(value));
  }

  @override
  Widget build(BuildContext context) {
    final calculatorData = context.watch<CalculatorProvider>();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
          // backgroundColor: Colors.deepPurple,
          title: const Text('Simple Calculator'),
          centerTitle: true),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: calculatorData.formkey,
          child: ListView(children: [
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Text('Result : ${calculatorData.result}',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 5),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter a valid Number';
                      }
                      return null;
                    },
                    textInputAction: TextInputAction.next,
                    controller: calculatorData.number1,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        errorStyle: const TextStyle(color: Colors.yellowAccent),
                        hintStyle: const TextStyle(color: Colors.white),
                        labelStyle: const TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        labelText: 'First Number',
                        hintText: 'Enter the number'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 5),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter a valid Number';
                      }
                      return null;
                    },
                    textInputAction: TextInputAction.done,
                    controller: calculatorData.number2,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        errorStyle: const TextStyle(color: Colors.yellowAccent),
                        hintStyle: const TextStyle(color: Colors.white),
                        labelStyle: const TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        labelText: 'Second Number',
                        hintText: 'Enter the number'),
                  ),
                ),
                Row(
                  children: [
                    Expanded(child: myButton('+', calculatorData)),
                    Container(width: 5),
                    Expanded(child: myButton('-', calculatorData)),
                  ],
                ),
                Row(
                  children: [
                    Expanded(child: myButton('x', calculatorData)),
                    Container(width: 5),
                    Expanded(child: myButton('/', calculatorData))
                  ],
                ),
                ElevatedButton(
                    onPressed: () {
                      calculatorData.doReset();
                    },
                    child: const Text('Reset'))
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
