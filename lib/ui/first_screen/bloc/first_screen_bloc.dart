import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'first_screen_event.dart';
part 'first_screen_state.dart';

class FirstScreenBloc extends Bloc<FirstScreenEvent, FirstScreenState> {
  FirstScreenBloc() : super(FirstScreenInitial("", "")) {
    on<NameChangedEvent>((event, emit) {
      emit(FirstScreenInitial(event.name, state.palindromText));
    });

    on<PalindromTextChangedEvent>((event, emit) {
      emit(FirstScreenInitial(state.name, event.palindromText));
    });
  }
}
