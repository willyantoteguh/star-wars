part of 'people_bloc.dart';

abstract class PeopleState extends Equatable {
  const PeopleState();
}

class PeopleInitial extends PeopleState {
  @override
  List<Object> get props => [];
}

class PeopleLoaded extends PeopleState {
  final List<People> people;

  PeopleLoaded({this.people});

  @override
  List<Object> get props => [people];
}
