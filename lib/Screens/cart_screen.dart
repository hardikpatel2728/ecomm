import 'package:ecomm/model/cartmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/cart/cart_bloc.dart';
import '../widget/cartproduct_card.dart';
import '../widget/customAppBar.dart';

class cartScreen extends StatelessWidget {
  static const String routeName = '/cart';

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => cartScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomeAppBar(title: 'Cart'),
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          child: Container(
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.black),
                    onPressed: () {},
                    child: Text('Go To CheckOut'))
              ],
            ),
          ),
        ),
        body: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            if (state is CartLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is CartLoaded) {
              return SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                state.cart.freedeliveryString,
                                style: Theme.of(context).textTheme.headline5!,
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/');
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.black,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    elevation: 0,
                                  ),
                                  child: Text(
                                    'Add More Item',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline4!
                                        .copyWith(color: Colors.white),
                                  ))
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 500,
                            child: Container(
                              child: ListView.builder(
                                itemCount: state.cart
                                    .productQuantity(state.cart.products)
                                    .keys
                                    .length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 3, color: Colors.black)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: CartProduct(
                                            product: state.cart
                                                .productQuantity(
                                                    state.cart.products)
                                                .keys
                                                .elementAt(index),
                                            quantity:state.cart
                                                .productQuantity(
                                                state.cart.products)
                                                .values
                                                .elementAt(index),
                                          ),
                                        )),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Divider(
                            thickness: 2,
                          ),
                          SizedBox(
                            height: 70,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 10),
                            child: Column(children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('SubTotal'),
                                  Text('\u20B9${state.cart.subtotalString}'),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Delivery Fee'),
                                  Text('\u20B9${state.cart.deliveryFeeString}'),
                                ],
                              ),
                            ]),
                          ),
                          Stack(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 60,
                                decoration: BoxDecoration(
                                    color: Colors.black.withAlpha(50)),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.all(5),
                                height: 46.5,
                                decoration: BoxDecoration(color: Colors.black),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Total',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5!
                                            .copyWith(color: Colors.white),
                                      ),
                                      Text(
                                        '\u20B9${state.cart.TotalString}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5!
                                            .copyWith(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return Text('Something went wrong');
            }
          },
        ));
  }
}
