import 'package:flutter/material.dart';

import '../../../home/presentation/pages/home_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    });

    return const Scaffold(
      body: Center(
        child: FlutterLogo(size: 120),
      ),
    );
  }
}
