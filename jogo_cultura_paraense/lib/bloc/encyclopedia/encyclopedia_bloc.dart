import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:jogo_cultura_paraense/model/encyclopedia_entry.dart';
import 'package:jogo_cultura_paraense/services/encyclopedia_service.dart';
import 'package:meta/meta.dart';

part 'encyclopedia_event.dart';
part 'encyclopedia_state.dart';

class EncyclopediaBloc extends Bloc<EncyclopediaEvent, EncyclopediaState> {
  final EncyclopediaService _service;

  EncyclopediaBloc(EncyclopediaService service)
      : _service = service,
        super(EncyclopediaInitial());

  @override
  Stream<EncyclopediaState> mapEventToState(
    EncyclopediaEvent event,
  ) async* {
    if (event is LoadEncyclopedia) {
      yield EncyclopediaLoading();
      try {
        final entries = await _service.fetchEntries();
        print(entries.length);
        yield EncyclopediaLoaded(entries);
      } catch (error) {
        yield EncyclopediaFailed(error.toString());
      }
    } else {
      yield state;
    }
  }
}
