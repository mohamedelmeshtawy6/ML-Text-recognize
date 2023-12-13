part of 'hometext_cubit.dart';

@immutable
sealed class HometextState {}

final class HometextInitial extends HometextState {}
final class  Recognized  extends HometextState {
 final String text;

  Recognized({required this.text});
}