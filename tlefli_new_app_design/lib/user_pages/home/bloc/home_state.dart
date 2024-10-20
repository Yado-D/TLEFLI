part of 'home_bloc.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}

class BottomNavBarState extends HomeState {
  int SelectedIndex;
  BottomNavBarState({this.SelectedIndex = 2});
}
