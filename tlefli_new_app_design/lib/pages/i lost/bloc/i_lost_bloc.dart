import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'i_lost_event.dart';
part 'i_lost_state.dart';

class ILostBloc extends Bloc<ILostEvent, ILostState> {
  ILostBloc() : super(ILostInitial()) {
    on<ItemNameEvent>(itemNameEvent);
  }

  FutureOr<void> itemNameEvent(
    ItemNameEvent event,
    Emitter<ILostState> emit,
  ) {
    emit(ItemNameState(itemName: event.itemName));
  }
}
