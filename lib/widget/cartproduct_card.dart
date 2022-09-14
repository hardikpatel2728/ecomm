import 'package:ecomm/bloc/cart/cart_bloc.dart';
import 'package:ecomm/model/model.dart';
import 'package:ecomm/model/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/Product_model.dart';

class CartProduct extends StatelessWidget {
  final Product product;
  final int quantity;

  const CartProduct({Key? key, required this.product,required this.quantity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 3, color: Colors.black)),
              child: Image.network(
                product.imgUrl,
                width: 100,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: Theme.of(context).textTheme.headline5!,
                  ),
                  Text(
                    "\u20B9${product.price}",
                    style: Theme.of(context).textTheme.headline5!,
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            BlocBuilder<CartBloc, CartState>(
  builder: (context, state) {
    return Row(
              children: [
                IconButton(onPressed: () {
                  context.read<CartBloc>().add(CartProductAdded(product));
                }, icon: Icon(Icons.add_circle)),
                Text(
                  "$quantity",
                  style: Theme.of(context).textTheme.headline5!,
                ),
                IconButton(onPressed: () {
                  context.read<CartBloc>().add(CartProductRemoved(product));
                }, icon: Icon(Icons.remove_circle)),
              ],
            );
  },
)
          ],
        ),
      ),
    );
  }
}