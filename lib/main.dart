import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:screens/widgets/bottom_navigation/bottom_navigation.dart';
import 'package:screens/widgets/onboard_screen.dart';
import 'package:screens/widgets/page_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UI Practice',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const OnBoardScreen(),
    );
  }
}
