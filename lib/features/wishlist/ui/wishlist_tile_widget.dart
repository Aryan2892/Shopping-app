import 'package:flutter/material.dart';
import 'package:shopping_app/features/cart/bloc/cart_bloc.dart';
import 'package:shopping_app/features/home/models/home_product_data_model.dart';
import 'package:shopping_app/features/wishlist/bloc/wishlist_bloc.dart';

class WishlistTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  final WishlistBloc wishlistBloc;

  const WishlistTileWidget({
    super.key,
    required this.productDataModel,
    required this.wishlistBloc,
  });

  @override
  Widget build(BuildContext context) {
    final cartBloc = CartBloc();

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                productDataModel.imageUrl,
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 15),

            // Product Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productDataModel.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    productDataModel.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "\$${productDataModel.price}",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),

            // Action Buttons
            Column(
              children: [
                IconButton(
                  onPressed: () {
                    wishlistBloc.add(WishlistRemoveFromWishlistEvent(
                      productDataModel: productDataModel,
                    ));
                  },
                  icon: const Icon(
                    Icons.favorite,
                    color: Colors.redAccent,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    cartBloc.add(CartRemoveFromCartEvent(
                      productDataModel: productDataModel,
                    ));
                  },
                  icon: const Icon(
                    Icons.shopping_bag,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
