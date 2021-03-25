import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jogo_cultura_paraense/bloc/map/map_bloc.dart';
import 'package:jogo_cultura_paraense/components/loading_progress.dart';
import 'package:jogo_cultura_paraense/components/map/map.dart';
import 'package:jogo_cultura_paraense/components/map/map_tutorial_1.dart';
import 'package:jogo_cultura_paraense/components/map/map_tutorial_2.dart';
import 'package:jogo_cultura_paraense/components/transparent_circle_button.dart';

// Class to pass information about the game display in the map.
class GamePosition {
  final double top;
  final double left;
  String title;
  bool isOpen;

  GamePosition({
    @required this.top,
    @required this.left,
    this.title,
    this.isOpen,
  });
}

// Class to build the games according to the current save.
class MapPage extends StatelessWidget {
  final int _gamesOpen;
  final String _region;
  final String _city;
  final List<GamePosition> _gamesPositions;
  const MapPage(
      {@required int gamesOpen,
      @required String region,
      @required String city,
      @required List<GamePosition> gamesPositions,
      Key key})
      : _gamesOpen = gamesOpen,
        _region = region,
        _city = city,
        _gamesPositions = gamesPositions,
        super(key: key);

  // Tells the state to load the assets needed for the current map.
  void _loadMapAssets(BuildContext context) {
    BlocProvider.of<MapBloc>(context).add(LoadMapAssets(_region, _gamesOpen));
  }

  void _showSecondTutorial(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      isDismissible: false,
      builder: (BuildContext context) {
        return MapSecondTutorial(onClick: () {
          Navigator.of(context).pop();
        });
      },
    );
  }

  void _showFirstTutorial(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      isDismissible: false,
      builder: (BuildContext context) {
        return MapFirstTutorial(
          city: _city,
          region: _region,
          onAction: () {
            Navigator.of(context).pop();
            _showSecondTutorial(context);
          },
        );
      },
    );
  }

  // Tells the button what to do if the game is open.
  void _onOpenGamePressed(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          backgroundColor: Color.fromRGBO(233, 213, 136, 1),
          content: Text(
            'Jogo habilitado!',
            textAlign: TextAlign.center,
          ),
        );
      },
    );
  }

  // Tells the button what to do if the game is closed.
  void _onClosedGamePressed(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          backgroundColor: Color.fromRGBO(233, 213, 136, 1),
          content: Text(
            'Você ainda não habilitou esse jogo!',
            textAlign: TextAlign.center,
          ),
        );
      },
    );
  }

  // Build the button widgets representing the games of the map.
  List<TransparentCircleButton> _buildGames(BuildContext context) {
    final games = <TransparentCircleButton>[];
    Function onPressed;
    for (GamePosition position in _gamesPositions) {
      // Check what to tell the button to do based on openness of game.
      if (position.isOpen) {
        onPressed = () {
          _onOpenGamePressed(context);
        };
      } else {
        onPressed = () {
          _onClosedGamePressed(context);
        };
      }

      games.add(TransparentCircleButton(
        top: position.top,
        left: position.left,
        onPressed: onPressed,
      ));
    }
    return games;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MapBloc, MapState>(
      builder: (context, state) {
        // If the player hasn't open a map page yet, load the current page assets.
        if (state is MapInitial) {
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            _loadMapAssets(context);
          });
        } else if (state is MapAssetsLoaded) {
          // If the player has open a map page before, but it wasn't the current page
          // load the current page assets.
          if (state.mapAssets.region != _region) {
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              _loadMapAssets(context);
            });
          } else {
            // If the player is still in the first game of the map, show the tutorials.
            if (_gamesOpen == 1) {
              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                _showFirstTutorial(context);
              });
            }
            return Map(
              imagePath: state.mapAssets.image,
              games: _buildGames(context),
            );
          }
        }
        // If the assets are loading, show loading progress.
        return LoadingProgress(
          loadingFailed: state is MapAssetsFailed,
          retryCallBack: () {
            _loadMapAssets(context);
          },
        );
      },
      listenWhen: (previousState, currentState) {
        if (currentState is MapAssetsFailed) {
          return true;
        }
        return false;
      },
      listener: (context, dynamic state) {
        Scaffold /* Messenger */ .of(context).showSnackBar(
          SnackBar(content: Text(state.error)),
        );
      },
    );
  }
}
