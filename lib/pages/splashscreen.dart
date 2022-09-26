import 'package:evaluasi/pages/authentication.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    animation = Tween<double>(begin: 0, end: 300).animate(controller)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const AuthScreen(),
            ),
          );
        }
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) =>
      AnimatedSplashScreen(animation: animation);
}

class AnimatedSplashScreen extends AnimatedWidget {
  const AnimatedSplashScreen({Key? key, required Animation<double> animation})
      : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          'images/logo1.png',
          width: animation.value,
          height: animation.value,
        ),
      ),
    );
  }
}
