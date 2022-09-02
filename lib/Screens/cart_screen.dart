import 'package:flutter/material.dart';
import '../model/Product_model.dart';
import '../widget/customAppBar.dart';
import '../widget/customebottombar.dart';

class cartScreen extends StatelessWidget {
  static const String routeName = '/cart';

  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName), builder: (_) => cartScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomeAppBar(title: 'Cart'),
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          child: Container(
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.black),onPressed: () {}, child: Text('Go To CheckOut'))
              ],
            ),
          ),
        ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Add \u20B92000 for Free Delivery',
                          style: Theme.of(context).textTheme.headline5!,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/');
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.black,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              elevation: 0,
                            ),
                            child: Text(
                              'Add More Item',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(color: Colors.white),
                            ))
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(width: 5, color: Colors.black)),
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: CartProduct(
                          product: Product.product[0],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(width: 5, color: Colors.black)),
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: CartProduct(
                          product: Product.product[1],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(width: 5, color: Colors.black)),
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: CartProduct(
                          product: Product.product[2],
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Divider(
                      thickness: 2,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:40,vertical:10 ),
                      child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('SubTotal'),
                                Text('\u20B9 220'),
                              ],
                            ),
                            SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Delivery Fee'),
                                Text('\u20B9 70'),
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
                              color: Colors.black.withAlpha(50)
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.all(5),
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.black
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Total',style: Theme.of(context).textTheme.headline5!.copyWith(color: Colors.white),),
                                Text('\u20B9 70',style: Theme.of(context).textTheme.headline5!.copyWith(color: Colors.white),),
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
        ),
      ),
    );
  }
}

class CartProduct extends StatelessWidget {
  final Product product;

  const CartProduct({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.only(),
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
            SizedBox(
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
            SizedBox(
              width: 10,
            ),
            Row(
              children: [
                IconButton(onPressed: () {}, icon: Icon(Icons.add_circle)),
                Text(
                  "1",
                  style: Theme.of(context).textTheme.headline5!,
                ),
                IconButton(onPressed: () {}, icon: Icon(Icons.remove_circle)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
