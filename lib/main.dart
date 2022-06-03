import 'package:bookhub/app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'bookhub',
      theme: AppThemes.light,
      debugShowCheckedModeBanner: false,
      
      
    );
  }
}

