import 'package:dice_calculator/modules/home/HomePage.dart';
import 'package:dice_calculator/shared/keys/RoutesKey.dart';
import 'package:dice_calculator/shared/themes/AppColors.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Dice Calculator",
      theme: ThemeData(
        primaryColor: AppColors.primary,
        primarySwatch: Colors.blue,
      ),
      routes: {
        RoutesKey.home: (context) => HomePage(),
      },
      initialRoute: RoutesKey.home,
    );
  }
}
