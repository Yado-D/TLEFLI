import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<BottomNavBarEvent>(bottomNavBarEvent);
  }
  void bottomNavBarEvent(BottomNavBarEvent event, Emitter emit) {
    emit(BottomNavBarState(SelectedIndex: event.SelectedIndex));
  }
}
