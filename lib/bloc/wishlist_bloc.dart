import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:ecomm/model/wishlist_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import '../model/Product_model.dart';
part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistLoading());
    // on<WishlistEvent>((event, emit) {
    //   // TODO: implement event handler
    // });
    @override
  Stream<WishlistState> mapEventToState(WishlistEvent event,) async* {
      if (event is StartWishlist) {
        yield* mapStartWishlistToState();
      } else if (event is AddWishlistProduct) {
        yield* mapAddWishlistProductToState(event, state);
      } else if (event is RemoveWishlistProduct) {
        yield* mapRemoveWishlistProductToState(event, state);
      }
    }
  }
    Stream<WishlistState> mapStartWishlistToState() async* {
      yield WishlistLoading();
      try {
        await Future<void>.delayed(Duration(seconds: 1));
        yield const WishlistLoaded();
      } catch (_) {}
    }

    Stream<WishlistState> mapAddWishlistProductToState(AddWishlistProduct event,
        WishlistState state,) async* {
      if (state is WishlistLoaded) {
        try {
          yield WishlistLoaded(
            wishlist: Wishlist(
              products: List.from(state.wishlist.products)
                ..add(event.product),
            ),
          );
        } catch (_) {}
      }
    }
    Stream<WishlistState> mapRemoveWishlistProductToState(
        RemoveWishlistProduct event,
        WishlistState state,) async* {
      if (state is WishlistLoaded) {
        try {
          yield WishlistLoaded(
            wishlist: Wishlist(
              products: List.from(state.wishlist.products)
                ..remove(event.product),
            ),
          );
        } catch (_) {}
      }
    }

