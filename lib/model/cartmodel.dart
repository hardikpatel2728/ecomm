import 'package:equatable/equatable.dart';

import 'Product_model.dart';

class Cart extends Equatable{
  final List<Product> products;

  const Cart({this.products = const <Product>[]});

  @override
  List<Object?> get props => [products];

  Map productQuantity(products){
   var quantity = Map();
   products.forEach((products){
     if(!quantity.containsKey(products)){
       quantity[products] = 1;
     }
     else{
       quantity[products] +=1;
     }
   });
   return quantity;
  }


  double get subtotal => products.fold(0,(total,current)=>total + current.price);

  double deliveryFee(subtotal){
    if(subtotal >=2000){
      return 0.0;
    }
    else{
      return 120;
    }
  }
  double Total(subtotal,deliveryFee){
    return subtotal +deliveryFee(subtotal);
  }
  String freedelivery(subtotal){
    if(subtotal >= 2000){
      return 'You have Free Delivery';
    }
    else{
      double missing = 2000.0 - subtotal;
      return 'Add \u20B9${missing.toStringAsFixed(2)} for Free Delivery';
    }
  }
  String get subtotalString => subtotal.toStringAsFixed(2);
  String get TotalString => Total(subtotal,deliveryFee).toStringAsFixed(2);
  String get deliveryFeeString => deliveryFee(subtotal).toStringAsFixed(2);
  String get freedeliveryString => freedelivery(subtotal);

}