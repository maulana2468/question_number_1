// ignore_for_file: must_be_immutable

part of 'first_screen_bloc.dart';

abstract class FirstScreenEvent extends Equatable {
  const FirstScreenEvent();

  @override
  List<Object> get props => [];
}

class NameChangedEvent extends FirstScreenEvent {
  String name;

  NameChangedEvent(this.name);

  @override
  List<Object> get props => [name];
}

class PalindromTextChangedEvent extends FirstScreenEvent {
  String palindromText;

  PalindromTextChangedEvent(this.palindromText);

  @override
  List<Object> get props => [palindromText];
}
