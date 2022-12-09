import 'package:flutter/material.dart';
import 'package:mocky/view/widget/app_text_view.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: appTextView(name: 'Splash Screen', isBold: true, size: 18),
      ),
    );
  }

  void init() {
    Future.delayed(
      const Duration(seconds: 3),
      () =>
          Navigator.pushNamedAndRemoveUntil(context, "/home", (route) => false),
    );
  }
}
