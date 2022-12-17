// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';

import 'homeScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(children: [
        _FondoBox(),
        // const Center(child: _HeaderIcon())
        Center(
          child: Container(
            width: 350,
            height: 90,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/icono.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
        )
        //contenedor para poner el widget del icono de login
      ]),
    );
  }
}

class _FondoBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration:
          const BoxDecoration(color: const Color.fromARGB(255, 21, 26, 44)),
    );
  }
}
