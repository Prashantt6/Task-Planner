import 'dart:async';
import 'package:flutter/material.dart';
import 'package:to_do_list/homescreen.dart';
import 'package:to_do_list/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const homescreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2C2C2C),
      appBar: AppBar(
        backgroundColor: Color(0xFF2C2C2C),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 100,
              height: 100,
              child: Image.asset('assets/logo/10700773.png'),
            ),
            const SizedBox(height: 16),
            const Text(
              "Daily Planner",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'fonthead'
              ),

            )
          ],
        ),
      ),
    );
  }
}
