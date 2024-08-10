import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/features/wishlist/bloc/wishlist_bloc.dart';
import 'package:shopping_app/features/wishlist/ui/wishlist_tile_widget.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({super.key});

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  final WishlistBloc wishlistBloc = WishlistBloc();

  @override
  void initState() {
    wishlistBloc.add(WishlistInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Wishlist'),
        backgroundColor: Colors.indigo[300],
      ),
      body: BlocConsumer<WishlistBloc, WishlistState>(
        bloc: wishlistBloc,
        listener: (context, state) {},
        listenWhen: (previous, current) => current is WishlistActionState,
        buildWhen: (previous, current) => current is! WishlistActionState,
        builder: (context, state) {
          if (state is WishlistSuccessState) {
            final successState = state as WishlistSuccessState;
            return ListView.builder(
              itemCount: successState.wishlistItems.length,
              itemBuilder: (context, index) {
                return WishlistTileWidget(
                  productDataModel: successState.wishlistItems[index],
                  wishlistBloc: wishlistBloc,
                );
              },
            );
          } else {
            return Center(
              child: Text(
                'Your wishlist is empty!',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[700],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
