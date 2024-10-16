part of 'i_lost_bloc.dart';

@immutable
sealed class ILostEvent {}

class ItemNameEvent extends ILostEvent {
  final String? itemName;
  ItemNameEvent({
    this.itemName = 'None',
  });
}
