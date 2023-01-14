import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'second_screen_event.dart';
part 'second_screen_state.dart';

class SecondScreenBloc extends Bloc<SecondScreenEvent, SecondScreenState> {
  SecondScreenBloc() : super(SecondScreenInitial("Selected User Name")) {
    on<SelectedUser>((event, emit) {
      emit(SecondScreenInitial(event.name));
    });
  }
}
