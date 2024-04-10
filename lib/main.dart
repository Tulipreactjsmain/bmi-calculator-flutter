import 'package:flutter/material.dart';
import 'screens/input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          appBarTheme: AppBarTheme(
            backgroundColor: Color(0Xff0a0e21),
          ),
          primaryColor: const Color(0Xff0a0e21),
          scaffoldBackgroundColor: Color(0Xff0a0e21)),
      debugShowCheckedModeBanner: false,
      // home: InputPage(),
      initialRoute: '/',
      routes: {
        '/': (context) => InputPage(),
      },
    );
  }
}
