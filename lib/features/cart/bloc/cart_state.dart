part of 'cart_bloc.dart';

@immutable
abstract class CartState {}

abstract class CartActionState extends CartState {}

final class CartInitial extends CartState {}

final class CartLoaded extends CartState {
  final List<ProductDataModel> cartItems;

  CartLoaded({required this.cartItems});
}
