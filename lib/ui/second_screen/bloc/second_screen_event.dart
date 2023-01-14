// ignore_for_file: must_be_immutable

part of 'second_screen_bloc.dart';

abstract class SecondScreenEvent extends Equatable {
  const SecondScreenEvent();

  @override
  List<Object> get props => [];
}

class SelectedUser extends SecondScreenEvent {
  String name;
  SelectedUser(this.name);

  @override
  List<Object> get props => [name];
}
