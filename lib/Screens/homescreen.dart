import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecomm/model/model.dart';
import 'package:ecomm/widget/hero_carousel.dart';
import 'package:flutter/material.dart';
import '../widget/Section_title.dart';
import '../widget/customAppBar.dart';
import '../widget/customebottombar.dart';
import '../widget/product_carousel.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/Home';

  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName), builder: (_) => HomeScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomeAppBar(
        title: 'Shopebee',
      ),
      bottomNavigationBar: CustomeBottomBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                aspectRatio: 1.5,
                viewportFraction: 0.9,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
                enlargeCenterPage: true,

              ),
              items: Categoryscreen.categori
                  .map((categoryscreen) =>
                  HeroCarousel(categoryscreen: categoryscreen))
                  .toList(),
            ),
            Sectiontitle(title: 'Recommended'),
            productCarousel(
                products: Product.product
                    .where((product) => product.isRecommended)
                    .toList()),
            Sectiontitle(title: 'Most Popular'),
            productCarousel(
                products: Product.product
                    .where((product) => product.isPopular)
                    .toList()),

          ],
        ),
      ),
    );
  }
}


