import 'package:bloc/bloc.dart';

import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitialize());

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is SelectTabEvent) {
      yield TabChange(event.tabId);
    }
  }
}
