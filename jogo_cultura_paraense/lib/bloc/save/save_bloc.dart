import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:jogo_cultura_paraense/model/item_save.dart';
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
    if (event is LoadSave || event is SaveClearedGame) {
      yield state.saveLoading();
      try {
        if (event is SaveClearedGame) {
          await _saveGameCleared(
            event.map,
            event.game,
            event.score,
            event.itens,
          );
        }
        yield await _loadSave();
      } catch (error) {
        yield state.saveFailed(error: error.toString());
      }
    } else if (event is SetCurrentSave) {
      yield state.saveLoaded(currentSaveIndex: event.nextCurrentSaveIndex);
    } else {
      yield state;
    }
  }

  Future<SaveLoaded> _loadSave() async {
    final save0 = await _appDataRepository.getSave(0);
    final save1 = await _appDataRepository.getSave(1);
    final save2 = await _appDataRepository.getSave(2);
    return state.saveLoaded(
      saves: <Save>[
        Save.fromJson(json.decode(save0)),
        Save.fromJson(json.decode(save1)),
        Save.fromJson(json.decode(save2)),
      ],
    );
  }

  Future<void> _saveGameCleared(
    String map,
    String game,
    int score,
    List<String> itens,
  ) async {
    final currentSave = state.currentSave;
    final currentMap = currentSave.getMapSave(map);
    final mapIndex = currentSave.mapsSave.indexOf(currentMap);
    final currentGame = currentMap.getGameSave(game);
    final gameIndex = currentMap.gamesSave.indexOf(currentGame);

    if (currentGame.topScores.length <= 5) {
      currentGame.topScores.add(score);
    } else if (score > currentGame.topScores.last) {
      currentGame.topScores.removeLast();
      currentGame.topScores.add(score);
    }
    currentGame.topScores.sort((a, b) => b - a);

    for (String item in itens) {
      currentSave.itensSave.add(
        ItemSave(title: item, gameTitle: currentGame.title, isViewable: true),
      );
    }

    if (gameIndex != currentMap.gamesSave.length - 1) {
      currentMap.gamesSave[gameIndex + 1] = currentGame.copyWith(isOpen: true);
    } else if (mapIndex != currentSave.mapsSave.length - 1) {
      currentSave.mapsSave[mapIndex + 1] = currentMap.copyWith(isOpen: true);
    }

    await _appDataRepository.updateSave(
      state.currentSaveIndex,
      state.currentSave,
    );
  }
}
