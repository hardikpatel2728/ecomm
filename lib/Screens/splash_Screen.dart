import 'dart:async';

import 'package:ecomm/model/model.dart';
import 'package:ecomm/widget/product_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../widget/customAppBar.dart';
import '../widget/customebottombar.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = '/Splash';

  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (context) => SplashScreen());
  }

  @override
  Widget build(BuildContext context) {
     Timer(Duration(seconds: 15), () => Navigator.pushNamed(context, '/'));
    return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
      children: [
          Lottie.asset("images/2.json",height: 300,width: 300),

      ],
    ),
        ));
  }
}
