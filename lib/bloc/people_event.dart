part of 'people_bloc.dart';

abstract class PeopleEvent extends Equatable {
  const PeopleEvent();
}

class FetchPeople extends PeopleEvent {
  @override
  List<Object> get props => [];
}
