import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/logo.png',
          fit: BoxFit.cover,
          height: 40,
        ),
        const SizedBox(
          width: 10,
        ),
        const Text('DashBoard'),
      ],
    );
  }
}
