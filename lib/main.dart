import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photoalbumtest/config/app_binding.dart';
import 'package:photoalbumtest/config/pages.dart';
import 'package:photoalbumtest/core/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Photo album',
      theme: theme,
      initialBinding: AppBinding(),
      initialRoute: initialPage,
      getPages: navPages,
    );
  }
}