import 'package:flutter/material.dart';
import 'package:myapp/pages/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora IMC',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(248, 119, 0, 255),
        ),
        
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Calculadora IMC'),
    );
  }
}
