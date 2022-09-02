import 'package:ecomm/bloc/wishlist_bloc.dart';
import 'package:ecomm/config/appRouter.dart';
import 'package:ecomm/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Screens/homescreen.dart';

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
      ], child: MaterialApp(
      title: 'Shopbee',
      theme: theme(),
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: HomeScreen.routeName,
    ),
    );

  }
}

