import 'package:ecomm/bloc/cart/cart_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/Product_model.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final double WidthFactor;
  final double leftPosition;
  final double? Double;
  final bool isWishlist;
  final double bottomPosition;
  final Color? boxColor;
  final Color? textColor;

  const ProductCard({
    Key? key,
    this.Double,
    this.boxColor,
    this.textColor,
    required this.product,
    this.WidthFactor = 2.5,
    this.leftPosition = 5,
    this.isWishlist = false,
    this.bottomPosition = 5,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double widthValue = MediaQuery.of(context).size.width / WidthFactor;
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/Product', arguments: product);
      },
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width / 2.5,
            height: 150,
            decoration: BoxDecoration(
                border: Border.all(
              width: 5,
              color: Colors.black,
            )),
            child: Image.network(
              product.imgUrl,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 60,
            left: leftPosition,
            bottom: bottomPosition,
            child: Container(
              width: widthValue - 5 - leftPosition,
              height: 80,
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(),
            ),
          ),
          Positioned(
            top: Double ?? 67,
            left: leftPosition + 2.5,
            child: Container(
              width: widthValue - 10 - leftPosition,
              height: 70,
              alignment: Alignment.bottomCenter,

              ///
              decoration:
                  BoxDecoration(color: boxColor ?? Colors.black.withAlpha(150)),

              ///
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.name,
                            style: Theme.of(context)
                                .textTheme
                                .headline4!
                                .copyWith(color: textColor ?? Colors.white),
                          ),
                          Text(
                            '\u20B9${product.price}',
                            style: Theme.of(context)
                                .textTheme
                                .headline4!
                                .copyWith(color: textColor ?? Colors.white),
                          ),
                        ],
                      ),
                    ),
                    BlocBuilder<CartBloc, CartState>(
                      builder: (context, state) {
                        if(state is CartLoading){
                          return Center(child: CircularProgressIndicator(),);
                        }
                        if(state is CartLoaded){
                          return Expanded(
                              child: IconButton(
                                  onPressed: () {
                                    context.read<CartBloc>().add(CartProductAdded(product));
                                  },
                                  icon: Icon(
                                    Icons.add_circle,
                                    color: textColor ?? Colors.white,
                                  )));
                        }else{
                          return Text('Somethiing went Wrong.');
                        }
                      },
                    ),
                    isWishlist
                        ? Expanded(
                            child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.delete,
                                  color: textColor ?? Colors.white,
                                )))
                        : SizedBox()
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
