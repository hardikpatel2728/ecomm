import 'package:flutter/material.dart';
import '../widget/customAppBar.dart';
import '../widget/customebottombar.dart';

class UserScreen extends StatelessWidget {
  static const String routeName = '/User';

  static Route route(){
    return MaterialPageRoute(settings: RouteSettings(name: routeName),builder: (_)=>UserScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomeAppBar(title: 'User'),
      bottomNavigationBar: CustomeBottomBar(),
    );
  }
}