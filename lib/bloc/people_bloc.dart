import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:star_wars/bloc/blocs.dart';
import 'package:star_wars/models/models.dart';
import 'package:star_wars/services/services.dart';

part 'people_event.dart';
part 'people_state.dart';

class PeopleBloc extends Bloc<PeopleEvent, PeopleState> {
  @override
  PeopleState get initialState => PeopleInitial();

  @override
  Stream<PeopleState> mapEventToState(
    PeopleEvent event,
  ) async* {
    if (event is FetchPeople) {
      List<People> people = await PeopleServices().getPeople();

      yield PeopleLoaded(people: people);
    }
  }
}
