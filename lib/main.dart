import 'package:flutter/material.dart';
import 'package:sixth_project_part/providers/calculator_provider.dart';
import 'package:sixth_project_part/screen/calculator.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CalculatorProvider())
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              appBarTheme: const AppBarTheme(color: Colors.deepPurple),
              brightness: Brightness.dark,
              textTheme:
                  const TextTheme(labelMedium: TextStyle(color: Colors.white))),
          title: 'Simple Calculator',
          home: const SafeArea(child: Calculator())),
    );
  }
}
