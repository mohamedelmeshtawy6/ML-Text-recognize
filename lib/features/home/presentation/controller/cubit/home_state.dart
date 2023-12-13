part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}
final class Homepickedsuccess extends HomeState {
final File image;

  Homepickedsuccess({required this.image});

}
final class Homepickedfail extends HomeState {}



