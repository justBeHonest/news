import 'package:flutter/material.dart';
import 'package:news/features/news_home/view/news_home_view.dart';
import 'package:news/product/utility/theme/app_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: NewsHomeView(),
      theme: AppThemeData.lightTheme,
      debugShowCheckedModeBanner: false,
    );
  }
}
