import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/data/grocery_data.dart';

import '../models/home_product_data_model.dart';
// import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeProductWishlistButtonClickedEvent>(
        homeProductWishlistButtonClickedEvent);
    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);
    on<HomeWishlistButtonNavigtateEvent>(homeWishlistButtonNavigtateEvent);
    on<HomeCartButtonNavigtateEvent>(homeCartButtonNavigtateEvent);
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(const Duration(seconds: 3));
    emit(HomeLoadedSuccessState(
        products: GroceryData.groceryProducts
            .map(
              (e) => ProductDataModel(
                name: e['name'],
                id: e['id'],
                description: e['description'],
                imageUrl: e['imageUrl'],
                price: e['price'],
              ),
            )
            .toList()));
  }

  FutureOr<void> homeProductWishlistButtonClickedEvent(
      HomeProductWishlistButtonClickedEvent event, Emitter<HomeState> emit) {
    log('Wishlist product button clicked');
  }

  FutureOr<void> homeProductCartButtonClickedEvent(
      HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {
    log('Cart product button clicked');
  }

  FutureOr<void> homeWishlistButtonNavigtateEvent(
      HomeWishlistButtonNavigtateEvent event, Emitter<HomeState> emit) {
    log('Wishlist button navigated');
    emit(HomeNavigateToWishlistPageActionState());
  }

  FutureOr<void> homeCartButtonNavigtateEvent(
      HomeCartButtonNavigtateEvent event, Emitter<HomeState> emit) {
    log('Cart button navigated');
    emit(HomeNavigateToCartPageActionState());
  }
}
