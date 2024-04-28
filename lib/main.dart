import 'package:flutter/material.dart';
import 'package:flutter_3/pages/choose_location.dart';
import 'package:flutter_3/pages/home.dart';
import 'package:flutter_3/pages/loading.dart';

void main() {
  runApp(MaterialApp(
    // home: Home(),
    initialRoute: '/',
    routes: {
      '/': (context) => const Loading(),
      '/home': (context) => const Home(),
      '/location': (context) => const ChooseLocation(),
    },
  ));
}
