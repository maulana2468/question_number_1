// ignore_for_file: must_be_immutable

part of 'first_screen_bloc.dart';

abstract class FirstScreenState extends Equatable {
  String name = "";
  String palindromText = "";

  FirstScreenState(this.name, this.palindromText);

  @override
  List<Object> get props => [name, palindromText];
}

class FirstScreenInitial extends FirstScreenState {
  FirstScreenInitial(super.name, super.palindromText);

  @override
  List<Object> get props => [name, palindromText];
}
