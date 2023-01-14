// ignore_for_file: must_be_immutable

part of 'second_screen_bloc.dart';

abstract class SecondScreenState extends Equatable {
  String name = "Selected User Name";
  SecondScreenState(this.name);

  @override
  List<Object> get props => [name];
}

class SecondScreenInitial extends SecondScreenState {
  SecondScreenInitial(super.name);

  @override
  List<Object> get props => [name];
}
