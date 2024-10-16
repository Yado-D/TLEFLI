part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class BottomNavBarEvent extends HomeEvent {
  int SelectedIndex;
  BottomNavBarEvent({required this.SelectedIndex});
}
