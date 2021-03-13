import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jogo_cultura_paraense/bloc/save/save_bloc.dart';
import 'package:jogo_cultura_paraense/components/map/map_page.dart';
import 'package:jogo_cultura_paraense/model/map_save.dart';

// Class to build a region page.
// It should be extended, not used by itself.
class RegionPage extends StatelessWidget {
  final Region _region;

  const RegionPage({
    @required Region region,
    Key key,
  })  : _region = region,
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
        final mapSave = state.currentSave.getMapSave(_region.name);
        final gamesPositions = getGamesPositions();
        // Add the save information on the games.
        for (int i = 0; i < mapSave.gamesSave.length; i++) {
          gamesPositions[i].title = mapSave.gamesSave[i].title;
          gamesPositions[i].isOpen = mapSave.gamesSave[i].isOpen;
        }

        return Scaffold(
          appBar: AppBar(title: Text(_region.name + ' - ' + _region.mainCity)),
          body: MapPage(
            region: _region.name,
            city: _region.mainCity,
            gamesOpen: mapSave.gamesOpen,
            gamesPositions: gamesPositions,
          ),
        );
      },
    );
  }
}
