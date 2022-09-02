import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomeBottomBar extends StatelessWidget {
  const CustomeBottomBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 0,
      color: Colors.white,
      child: Container(
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/Home");
                },
                icon: Icon(Icons.home,color: Colors.black,)),
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/cart");
                },
                icon: Icon(Icons.shopping_cart,color: Colors.black,)),
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/User");
                },
                icon: Icon(Icons.person,color: Colors.black,)),
          ],
        ),
      ),
    );
  }
}