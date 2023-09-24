import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_application_2/data/cart_data.dart';
import 'package:flutter_application_2/features/home/models/home_product_data_model.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(cartInitial);
    on<CartRemoveItem>(cartRemoveItem);
  }

  FutureOr<void> cartInitial(CartInitialEvent event, Emitter<CartState> emit) {
    emit(CartLoaded(cartItems: cartItems));
  }

  FutureOr<void> cartRemoveItem(CartRemoveItem event, Emitter<CartState> emit) {
    cartItems.remove(event.productDataModel);
    emit(CartLoaded(cartItems: cartItems));
  }
}
