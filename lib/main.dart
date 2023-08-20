import 'package:bank_app_ui/screens/splash_screen.dart';
import 'package:bank_app_ui/utils/assets.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(DevicePreview(
      isToolbarVisible: false,
      enabled: kIsWeb,
      builder: ((context) => const ProviderScope(child: MyApp()))));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(useMaterial3: true).copyWith(
        colorScheme: const ColorScheme.dark().copyWith(primary: coral),
      ),
      home: const SplashScreen(),
    );
  }
}
