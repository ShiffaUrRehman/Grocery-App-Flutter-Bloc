import 'package:flutter/material.dart';
import 'package:flutter_application_2/features/cart/bloc/cart_bloc.dart';
import 'package:flutter_application_2/features/cart/ui/cart_tile_widget.dart';
import 'package:flutter_application_2/features/home/ui/product_tile_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final CartBloc cartBloc = CartBloc();

  @override
  void initState() {
    cartBloc.add(CartInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cart Items')),
      body: BlocConsumer<CartBloc, CartState>(
        bloc: cartBloc,
        listenWhen: (previous, current) => current is CartActionState,
        buildWhen: (previous, current) => current is! CartActionState,
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.runtimeType) {
            case CartLoaded:
              final cartLoaded = state as CartLoaded;
              return ListView.builder(
                  itemCount: cartLoaded.cartItems.length,
                  itemBuilder: (context, index) {
                    return CartTileWidget(
                      productDataModel: cartLoaded.cartItems[index],
                      cartBloc: cartBloc,
                    );
                  });

            default:
              return SizedBox();
          }
        },
      ),
    );
  }
}
