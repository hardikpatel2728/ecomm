import 'package:ecomm/widget/product_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/wishlist/wishlist_bloc.dart';
import '../widget/customAppBar.dart';
import '../widget/customebottombar.dart';

class WishList extends StatelessWidget {
  static const String routeName = '/Wish';

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (context) => WishList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomeAppBar(
        title: 'WishList',
      ),
      bottomNavigationBar: const CustomeBottomBar(),
      body: BlocBuilder<WishlistBloc, WishlistState>(
        builder: (context, state) {
          if (state is WishlistLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          print(WishlistLoading());
          if (state is WishlistLoaded) {
            return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1, childAspectRatio: 2.3),
                itemCount: state.wishlist.products.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 165,
                    width: 250,
                    color: Colors.black,
                    child: Stack(children: [
                      Container(
                        margin: const EdgeInsets.all(5),
                        height: 155,
                        width: double.infinity,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ProductCard(
                            Double: 38,
                            boxColor: Colors.transparent,
                            textColor: Colors.black,
                            product: state.wishlist.products[index],
                            WidthFactor: 1.1,
                            leftPosition: 168,
                            isWishlist: true,
                          ),
                        ),
                      ),
                    ]),
                  );
                });
          } else {
            return Text('Something went Wrong');
          }
        },
      ),
    );
  }
}
