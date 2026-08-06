import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(NavigationState(currentIndex: 0)) {
    on<OnChangeNavigationIndex>(_onChangeNavigationIndex);
  }

  void _onChangeNavigationIndex(
    OnChangeNavigationIndex event,
    Emitter<NavigationState> emit,
  ) {
    emit(state.copyWith(currentIndex: event.index));
  }
}
