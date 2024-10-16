part of 'i_lost_bloc.dart';

@immutable
sealed class ILostState {}

final class ILostInitial extends ILostState {}

class ItemNameState extends ILostState {
  final String? itemName;
  ItemNameState({
    this.itemName = 'None',
  });
}
