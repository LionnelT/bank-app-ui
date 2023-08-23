import 'package:bank_app_ui/screens/login_screen/login_screen.dart';
import 'package:bank_app_ui/screens/main_screen.dart';
import 'package:bank_app_ui/utils/assets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:rive/rive.dart';
import 'package:lottie/lottie.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: 'Banking Made Easy',
          body:
              'Manage your money on the go with our secure and convenient mobile banking app. With just a few taps, you can check your balance, transfer money, pay bills, and more.',
          image: Lottie.network(
              width: 200,
              height: 200,
              fit: BoxFit.fill,
              'https://lottie.host/38d7d400-27e6-4135-9de7-f5df53f5183d/DiIsZv17ue.json'),
          decoration: buildDecoration(),
        ),
        PageViewModel(
          title: 'Convenient',
          body: 'Bank from anywhere, at any time.',
          image: Lottie.network(
              width: 200,
              height: 200,
              fit: BoxFit.fill,
              'https://lottie.host/f1bc2773-c9b7-451a-ad03-e30f2e7a7c5c/EsAGlc8qOq.json'),
          decoration: buildDecoration(),
        ),
        PageViewModel(
          title: '24/7 access',
          body: 'Bank around the clock.',
          image: Lottie.network(
              width: 200,
              height: 200,
              fit: BoxFit.fill,
              'https://lottie.host/74895596-d6c8-4d44-9c36-c90bb871d166/kVHSOImze1.json'),
          decoration: buildDecoration(),
        ),
      ],
      next: const Icon(
        Icons.navigate_next,
        size: 40,
        color: kPrimaryColor,
      ),
      done: const Text('Done',
          style: TextStyle(color: kPrimaryColor, fontSize: 20)),
      onDone: () => goToHome(context),
      showSkipButton: true,
      skip: const Text(
        'Skip',
        style: TextStyle(color: kPrimaryColor, fontSize: 20),
      ), //by default, skip goes to the last page
      onSkip: () => goToHome(context),
      dotsDecorator: getDotDecoration(),
      animationDuration: 1000,
      globalBackgroundColor: Colors.white,
    );
  }

  DotsDecorator getDotDecoration() => DotsDecorator(
      color: Colors.grey,
      size: const Size(10, 10),
      activeColor: kPrimaryColor,
      activeSize: const Size(22, 10),
      activeShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ));

  void goToHome(BuildContext context) => Navigator.of(context)
      .pushReplacement(MaterialPageRoute(builder: (_) => const LoginScreen()));

  Widget buildImage(String path) => Center(child: Image.asset(path));

  PageDecoration buildDecoration() => const PageDecoration(
        titleTextStyle: TextStyle(
            fontSize: 25, fontWeight: FontWeight.bold, color: kPrimaryColor),
        bodyTextStyle: TextStyle(fontSize: 20),
        pageColor: Colors.white,
        imagePadding: EdgeInsets.all(0),
      );
}
