import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:jogo_cultura_paraense/model/save.dart';
import 'package:jogo_cultura_paraense/repositories/appdata_repository.dart';
import 'package:meta/meta.dart';

part 'save_event.dart';
part 'save_state.dart';

class SaveBloc extends Bloc<SaveEvent, SaveState> {
  final AppDataRepository _appDataRepository = AppDataRepository();
  SaveBloc() : super(SaveInitial());

  @override
  Stream<SaveState> mapEventToState(dynamic event) async* {
    if (event is LoadSave) {
      yield SaveLoading();
      try {
        final save0 = await _appDataRepository.getSave(0);
        final save1 = await _appDataRepository.getSave(1);
        final save2 = await _appDataRepository.getSave(2);
        yield SaveLoaded(
          saves: <Save>[
            Save.fromJson(json.decode(save0)),
            Save.fromJson(json.decode(save1)),
            Save.fromJson(json.decode(save2)),
          ],
        );
      } catch (error) {
        yield SaveFailed(error.toString());
      }
    } else if (event is SetCurrentSave) {
      yield SaveLoaded(
        currentSaveIndex: event.nextCurrentSaveIndex,
        saves: state.saves,
      );
    } else {
      yield SaveLoaded(
        saves: state.saves,
        currentSaveIndex: event.nextCurrentSaveIndex,
      );
    }
  }
}
