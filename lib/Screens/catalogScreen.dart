import 'package:ecomm/model/model.dart';
import 'package:ecomm/widget/product_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widget/customAppBar.dart';
import '../widget/customebottombar.dart';

class CatalogScreen extends StatelessWidget {
  static const String routeName = '/catalog';

  static Route route({required Categoryscreen categoryscreen}) {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (context) => CatalogScreen(categoryscreen: categoryscreen));
  }

  final Categoryscreen categoryscreen;

  const CatalogScreen({required this.categoryscreen});

  @override
  Widget build(BuildContext context) {
    final List<Product> catagoryProduct = Product.product
        .where((product) => product.category == categoryscreen.name)
        .toList();
    return Scaffold(
      appBar: CustomeAppBar(
        title: categoryscreen.name,
      ),
      bottomNavigationBar: CustomeBottomBar(),
      body: GridView.builder(
        itemCount: catagoryProduct.length,
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 1.15),
        itemBuilder: (BuildContext context, int index) {
          return Center(
              child: ProductCard(
            product: catagoryProduct[index],
            WidthFactor: 2.5,
          ));
        },
      ),
    );
  }
}
