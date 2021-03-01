import 'package:flutter/material.dart';
import 'package:jogo_cultura_paraense/components/transparent_circle_button.dart';

// Class to display the map image and the games/buttons.
class Map extends StatelessWidget {
  final String _imagePath;
  final List<TransparentCircleButton> _games;
  const Map({
    @required String imagePath,
    @required List<TransparentCircleButton> games,
    Key key,
  })  : _imagePath = imagePath,
        _games = games,
        super(key: key);

  List<Widget> _buildGames(BuildContext context) {
    final games = <Widget>[
      Image.network(
        _imagePath,
        // Width is set to media height so that if orientation changes to landscape,
        // the buttons stay in the same position relative to the image.
        width: MediaQuery.of(context).size.height,
      )
    ];
    games.addAll(_games);
    return games;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Stack(children: _buildGames(context)),
      ),
    );
  }
}
