import 'package:ecomm/widget/product_card.dart';
import 'package:flutter/cupertino.dart';

import '../model/Product_model.dart';

class productCarousel extends StatelessWidget {
  final List<Product> products;
  const productCarousel({
    Key? key, required this.products,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(alignment: Alignment.topCenter,
      child: SizedBox(
        height: 165,
        child: ListView.builder(
          shrinkWrap: false,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          scrollDirection: Axis.horizontal,
          itemCount: products.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 5.0),
              child: ProductCard(product:products[index]),
            );
          },
        ),
      ),
    );
  }
}