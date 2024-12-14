import 'package:dainmart_sample/Pages/HomePage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: const Color(0xFF4169E1), // Royal Blue
        // accentColor: Color(0xFFFF6F61), // Coral
        // backgroundColor: Color(0xFFF8F9FA), // Off-white
        scaffoldBackgroundColor: const Color(0xFFFFFFFF), // Same as background
        // textTheme: TextTheme(
        //   headline6: TextStyle(color: Color(0xFF333333)), // Dark Grey for headers
        //   bodyText2: TextStyle(color: Color(0xFF666666)), // Medium Grey for body text
        // ),
        buttonTheme: const ButtonThemeData(
          buttonColor: Color(0xFF4169E1), // Royal Blue
          textTheme: ButtonTextTheme.primary,
        ),
        appBarTheme: const AppBarTheme(
          color: Color(0xFF436581), // Royal Blue
          iconTheme: IconThemeData(color: Colors.white), // White icons
        ),

        // scaffoldBackgroundColor: Colors.amberAccent,

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:HomePage(),
    );
  }
}
