import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

void main() => runApp(const FilmkuApp());

class FilmkuApp extends StatelessWidget {
  const FilmkuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Filmku',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.black, elevation: 0),
      ),
      home: const SplashScreen(),
    );
  }
}
