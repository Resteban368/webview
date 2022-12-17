import 'package:JGINVEST/splashScreen.dart';
import 'package:JGINVEST/utils/check_internet_connection.dart';
import 'package:flutter/material.dart';

final internetChecker = CheckInternetConnection();
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'JGINVEST',
      home: SplashScreen(),
      initialRoute: 'home',
    );
  }
}
