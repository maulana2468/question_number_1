// ignore_for_file: must_be_immutable

part of 'third_screen_bloc.dart';

abstract class ThirdScreenState extends Equatable {
  int pages = 0;
  DataAvailable status = DataAvailable.init;
  List<Datum?> listData;

  ThirdScreenState(this.pages, this.status, this.listData);

  @override
  List<Object> get props => [pages, status, listData];
}

class ThirdScreenInitial extends ThirdScreenState {
  ThirdScreenInitial(super.pages, super.status, super.listData);

  @override
  List<Object> get props => [pages, status, listData];
}
