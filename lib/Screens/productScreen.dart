import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecomm/model/model.dart';
import 'package:ecomm/widget/hero_carousel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/wishlist_bloc.dart';
import '../model/Product_model.dart';
import '../widget/customAppBar.dart';

class ProductScreen extends StatelessWidget {
  static const String routeName = '/Product';

  static Route route({required Product product}) {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (context) => ProductScreen(product: product));
  }

  final Product product;

  ProductScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomeAppBar(
        title: product.name,
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Container(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.share)),
              BlocBuilder<WishlistBloc, WishlistState>(
                builder: (context, state) {
                  return IconButton(
                      disabledColor: Colors.red,
                      onPressed: () {
                        context
                            .read<WishlistBloc>()
                            .add(AddWishlistProduct(product: product));

                        final snackBar = SnackBar(content: Text('Added to your WishList'));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                      icon: Icon(Icons.favorite));
                },
              ),
              ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.black),onPressed: () {}, child: Text('Add To Cart'))
            ],
          ),
        ),
      ),
      body: ListView(children: [
        CarouselSlider(
          options: CarouselOptions(
            aspectRatio: 1.6,
            viewportFraction: 0.9,
            enlargeStrategy: CenterPageEnlargeStrategy.height,
            enlargeCenterPage: true,
            enableInfiniteScroll: false,
            autoPlay: true,
          ),
          items: [
            HeroCarousel(
              product: product,
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width - 10,
                height: 60,
                alignment: Alignment.bottomCenter,
                color: Colors.black.withAlpha(50),
              ),
              Container(
                margin: EdgeInsets.all(5.0),
                width: MediaQuery.of(context).size.width,
                height: 50,
                alignment: Alignment.center,
                color: Colors.black,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        product.name,
                        style: Theme.of(context)
                            .textTheme
                            .headline3!
                            .copyWith(color: Colors.white),
                      ),
                      Text('\u20B9${product.price}',
                          style: Theme.of(context)
                              .textTheme
                              .headline3!
                              .copyWith(color: Colors.white)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: ExpansionTile(
            initiallyExpanded: true,
            title: Text(
              'Product Information',
              style: Theme.of(context).textTheme.headline3,
            ),
            children: [
              ListTile(
                title: Text(
                  'Giant Food is committed to providing accurate nutritional information to its customers.'
                  ' As an important part of that effort we voluntarily provide such material on our website.'
                  ' We rely upon our suppliers to provide us with this information on an ongoing basis and to advise us immediately whenever any new claims or adjustments to declared values are made,'
                  ' so that we can properly maintain the accuracy of this online resource. We have, however, experienced occasional situations in the past where, due to the lack of such notice or for some other reason, minor discrepancies in this area have occurred.'
                  ' We therefore strongly encourage our customers to read the labels of any of the products that they purchase in order to make certain that they are compatible with their own nutritional preferences and expectations.'
                  ' If you receive a product from Giant Food, and the nutritional information on the product label does not match the information on our site, please contact Giant Food customer service and we will arrange for a credit to issue for the product at issue.',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: ExpansionTile(
            initiallyExpanded: true,
            title: Text(
              'Product Details',
              style: Theme.of(context).textTheme.headline3,
            ),
            children: [
              ListTile(
                title: Text(
                  """Sunkist® Fruit Punch Soda. 12 pack.
Natural & artificial flavors. Let's Play™. 180 calories per can.
12-12 fl oz cans (144 fl oz). 12-355 ml cans (4.3L). Caffeine free.
Sunkist is a registered trademark of Sunkist Growers,
Inc., USA used under license by Dr Pepper/Seven Up, Inc.
See unit container for manufacturer's identity.\nConsumer comments? 1-866-374-6567. Please recycle.
sunkistsoda.com. ©2013 Sunkist Growers, Inc.
and Dr Pepper/Seven Up, Inc. All rights reserved.""",
                  textAlign: TextAlign.justify,
                  overflow: TextOverflow.clip,
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
