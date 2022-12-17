// ignore_for_file: file_names

import 'package:JGINVEST/utils/WarningWidgetChangeNotifier.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //tamano del appbar
        toolbarHeight: 5,
        backgroundColor:
            // #283252
            const Color.fromARGB(255, 21, 26, 44),
      ),
      body: Container(
        color: const Color.fromARGB(255, 21, 26, 44),
        width: double.infinity,
        height: double.infinity,
        child: const WarningWidgetChangeNotifier(),
      ),
    );
  }
}
