import 'package:ecomm/Screens/homescreen.dart';
import 'package:ecomm/Screens/screens.dart';
import 'package:ecomm/Screens/user_screen.dart';
import 'package:ecomm/model/model.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    print('This is Route:${settings.name}');

    switch (settings.name) {
      case '/':
        return HomeScreen.route();
      case HomeScreen.routeName:
        return HomeScreen.route();
      case cartScreen.routeName:
        return cartScreen.route();
      case UserScreen.routeName:
        return UserScreen.route();
      case CatalogScreen.routeName:
        return CatalogScreen.route(categoryscreen: settings.arguments as Categoryscreen);
      case ProductScreen.routeName:
        return ProductScreen.route(product: settings.arguments as Product);
      case WishList.routeName:
        return WishList.route();

      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: '/error'),
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: Text('error'),
              ),
            ));
  }
}
