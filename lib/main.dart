import 'package:flutter/material.dart';
import 'package:task/pages/home_screen.dart';
import 'package:task/pages/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task',
      theme: ThemeData(
        primarySwatch: Colors.green,
        snackBarTheme: SnackBarThemeData(
          backgroundColor: Colors.green,
          actionTextColor: Colors.white,
        )
      ),

      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}
