import 'package:flutter/material.dart';
import 'package:shopping_app/features/home/bloc/home_bloc.dart';
import 'package:shopping_app/features/home/models/home_product_data_model.dart';

class ProductTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  final HomeBloc homeBloc;
  const ProductTileWidget(
      {super.key, required this.productDataModel, required this.homeBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          height: 200,
          width: double.maxFinite,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: NetworkImage(productDataModel.imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          productDataModel.name,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(productDataModel.description),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "\$${productDataModel.price}",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    homeBloc.add(HomeProductWishlistButtonClickedEvent(
                      clickedProduct: productDataModel,
                    ));
                  },
                  icon: const Icon(Icons.favorite),
                ),
                IconButton(
                  onPressed: () {
                    homeBloc.add(HomeProductCartButtonClickedEvent(
                      clickedProduct: productDataModel,
                    ));
                  },
                  icon: const Icon(Icons.shopping_cart),
                ),
              ],
            )
          ],
        ),
      ]),
    );
  }
}
