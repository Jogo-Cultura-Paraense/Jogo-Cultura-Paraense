import 'package:flutter/material.dart';

class Map extends StatelessWidget {
  final List<Container> _children;
  const Map({
    @required List<Container> children,
    Key key,
  })  : _children = children,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(2),
      crossAxisCount: 4,
      children: _children,
    );
  }
}

class Map2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Stack(
          children: <Widget>[
            Image.asset(
              'lib/images/474(1).png',
              width: MediaQuery.of(context).size.height,
            ),
            Positioned(
              top: 20,
              left: 30,
              child: ElevatedButton(
                child: Icon(
                  Icons.circle,
                  color: Colors.transparent,
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                  // shadowColor: Colors.transparent,
                  shape: CircleBorder(),
                ),
                onPressed: () {
                  print('aqui');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
