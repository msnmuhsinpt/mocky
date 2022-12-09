import 'package:flutter/material.dart';
import 'package:mocky/util/app_rout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mocky',
      //app rout
      initialRoute: '/splash',
      onGenerateRoute: onGenerateRoute,
    );
  }
}
