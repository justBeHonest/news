import 'package:flutter/material.dart';
import 'package:news/features/news_home/view/news_home_view.dart';
import 'package:news/product/controller/ui_controller/ui.dart';
import 'package:news/product/utility/theme/app_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    // UI.setStatusBarPrimaryColor();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home:
          // Text('sdfsdfsdfsdfsdf'),
          NewsHomeView(),
      theme: AppThemeData.lightTheme,
      debugShowCheckedModeBanner: false,
    );
  }
}
