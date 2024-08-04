part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

abstract class HomeAction extends HomeState {}

final class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedSuccessState extends HomeState {}

class HomeErrorState extends HomeState {}

class HomeNavigateToWishlistPageActionState extends HomeAction {}

class HomeNavigateToCartPageActionState extends HomeAction {}