import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true,colorScheme: ColorScheme.fromSeed(seedColor: CupertinoColors.systemGreen)),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      home: const MainPage(),
    );
  }
}
