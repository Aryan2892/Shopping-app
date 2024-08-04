import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
// import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeProductWishlistButtonClickedEvent>(homeProductWishlistButtonClickedEvent);
    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);
    on<HomeWishlistButtonNavigtateEvent>(homeWishlistButtonNavigtateEvent);
    on<HomeCartButtonNavigtateEvent>(homeCartButtonNavigtateEvent);
  }

  FutureOr<void> homeProductWishlistButtonClickedEvent(HomeProductWishlistButtonClickedEvent event, Emitter<HomeState> emit) {
    log('Wishlist product button clicked');
  }

  FutureOr<void> homeProductCartButtonClickedEvent(HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {
    log('Cart product button clicked');
  }

  FutureOr<void> homeWishlistButtonNavigtateEvent(HomeWishlistButtonNavigtateEvent event, Emitter<HomeState> emit) {
    log('Wishlist button navigated');
    emit(HomeNavigateToWishlistPageActionState());
  }

  FutureOr<void> homeCartButtonNavigtateEvent(HomeCartButtonNavigtateEvent event, Emitter<HomeState> emit) {
    log('Cart button navigated');
    emit(HomeNavigateToCartPageActionState());

  }
}
