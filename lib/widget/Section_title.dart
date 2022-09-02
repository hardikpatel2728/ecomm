import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Sectiontitle extends StatelessWidget {
  final String title;
  const Sectiontitle({
    Key? key, required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              title,
              style: Theme.of(context).textTheme.headline3,
            )));
  }
}