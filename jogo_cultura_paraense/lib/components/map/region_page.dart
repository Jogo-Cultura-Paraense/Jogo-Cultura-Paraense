import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jogo_cultura_paraense/bloc/save/save_bloc.dart';
import 'package:jogo_cultura_paraense/components/map/map_page.dart';
import 'package:jogo_cultura_paraense/model/map.dart';

// Class to build a region page.
// It should be extended, not used by itself.
class RegionPage extends StatelessWidget {
  final GameMap _gameMap;

  const RegionPage({
    @required GameMap gameMap,
    Key key,
  })  : _gameMap = gameMap,
        super(key: key);

  // Must be implemented on child.
  // It buid the positions of the buttons on the map.
  List<GamePosition> getGamesPositions() {
    throw UnimplementedError();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SaveBloc, SaveState>(
      builder: (context, state) {
        // Get the save of the map from the state.
        final mapSave = state.currentSave.getMapSave(_gameMap.region);
        final gamesPositions = getGamesPositions();
        // Add the save information on the games.
        for (int i = 0; i < mapSave.gamesSave.length; i++) {
          gamesPositions[i].title = mapSave.gamesSave[i].title;
          gamesPositions[i].isOpen = mapSave.gamesSave[i].isOpen;
        }

        return Scaffold(
          appBar: AppBar(
            title: Text(_gameMap.region + ' - ' + _gameMap.city),
          ),
          body: MapPage(
            region: _gameMap.region,
            city: _gameMap.city,
            gamesOpen: mapSave.gamesOpen,
            gamesPositions: gamesPositions,
          ),
        );
      },
    );
  }
}
