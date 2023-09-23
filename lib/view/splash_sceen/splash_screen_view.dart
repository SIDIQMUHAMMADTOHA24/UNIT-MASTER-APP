import 'package:flutter/material.dart';
import 'package:semicircle_indicator/semicircle_indicator.dart';

// ignore: must_be_immutable
class SplashScreenView extends StatelessWidget {
  SplashScreenView({super.key});

  double number = 0;

  void nextPage(BuildContext context) async {
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.of(context).pushNamedAndRemoveUntil('/mode', (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: TweenAnimationBuilder(
        tween: Tween<double>(begin: 0, end: 1.0),
        duration: const Duration(seconds: 3),
        builder: (context, value, child) {
          number = value;
          if (number == 1.0) {
            nextPage(context);
          }
          return SemicircularIndicator(
            backgroundColor: Colors.blue.shade100,
            color: Colors.blue.shade500,
            progress: value,
            strokeWidth: 30,
            child: Text(
              '${(value * 100).toStringAsFixed(0)} %',
              style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
          );
        },
      )),
    );
  }
}
