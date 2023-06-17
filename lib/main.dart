import 'package:flutter/material.dart';
import 'package:flutter_rickandmorty_api/ui/screen/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final green = Colors.green;
    final greenDark = Color.fromARGB(255, 66, 157, 71);
    final white = Colors.white;
    final black = Colors.black;
    final scaffoldBackground = Color.fromARGB(255, 3, 35, 20);
    final cardDark = Color.fromARGB(255, 5, 48, 32);
    final cardLight = Colors.white;

    ThemeData lightTheme = ThemeData(
      primarySwatch: green,
      appBarTheme: AppBarTheme(
        backgroundColor: green,
      ),
      textTheme: TextTheme(
        bodyMedium: TextStyle(
          color: black,
        ),
      ),
      scaffoldBackgroundColor: white,
      cardTheme: CardTheme(
        color: cardLight,
        shadowColor: green,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            20,
          ),
        ),
      ),
      hintColor: black,
      canvasColor: green,
      shadowColor: black,
    );

    ThemeData darkTheme = ThemeData(
      primarySwatch: green,
      appBarTheme: AppBarTheme(
        backgroundColor: greenDark,
      ),
      textTheme: TextTheme(
        bodyMedium: TextStyle(
          color: white,
        ),
      ),
      scaffoldBackgroundColor: scaffoldBackground,
      cardTheme: CardTheme(
        shadowColor: black,
        color: cardDark,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            20,
          ),
        ),
      ),
      hintColor: white,
      highlightColor: Colors.green,
      canvasColor: greenDark,
      shadowColor: white,
    );
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      home: HomeScreen(),
    );
  }
}
