import 'package:ecomm/model/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../model/category_model.dart';

class HeroCarousel extends StatelessWidget {
  final Categoryscreen? categoryscreen;
  final Product? product;

  const HeroCarousel({this.categoryscreen, this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: () {
      if(this.product == null){
        Navigator.pushNamed(context, '/catalog',arguments: categoryscreen);
      }
    },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5.0,vertical: 20),
        child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
            child: Stack(
              children: <Widget>[
                Image.network(
                    product == null ? categoryscreen!.imgUrl : product!.imgUrl,
                    fit: BoxFit.cover, width: 1000.0),
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(200, 0, 0, 0),
                          Color.fromARGB(0, 0, 0, 0)
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    padding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    child: Text(
                        product == null ? categoryscreen!.name : '',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}