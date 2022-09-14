import 'package:ecomm/bloc/wishlist/wishlist_bloc.dart';
import 'package:ecomm/config/appRouter.dart';
import 'package:ecomm/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Screens/homescreen.dart';
import 'Screens/splash_Screen.dart';
import 'bloc/cart/cart_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:[
        BlocProvider(create: (_)=>WishlistBloc()..add(StartWishlist())),
        BlocProvider(create: (_)=>CartBloc()..add(CartStarted())),
      ], child: MaterialApp(
      title: 'Shopbee',
      theme: theme(),
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: SplashScreen.routeName,
    ),
    );

  }
}

