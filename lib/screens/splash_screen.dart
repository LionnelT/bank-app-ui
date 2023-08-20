import 'package:bank_app_ui/screens/main_screen.dart';
import 'package:bank_app_ui/utils/assets.dart';
import 'package:bank_app_ui/widgets/login_option_button.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF432148), Color(0xFF213048)],
          ),
        ),
        child: SafeArea(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Text('Bank App', style: Theme.of(context).textTheme.displayLarge),
              SizedBox(
                child: Column(
                  children: [
                    const Spacer(),
                    Text(
                      'Sign in by',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 33),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          LoginOptionButton(
                            assetPath: faceIdImage,
                            title: 'Face Id',
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => const MainScreen()),
                              );
                            },
                          ),
                          LoginOptionButton(
                            assetPath: pinCodeImage,
                            title: 'Pin Code',
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => const MainScreen()),
                              );
                            },
                          ),
                          LoginOptionButton(
                            assetPath: otherImage,
                            title: 'Other',
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => const MainScreen()),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
