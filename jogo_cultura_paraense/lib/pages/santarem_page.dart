import 'package:flutter/material.dart';
import 'package:jogo_cultura_paraense/components/map.dart';

class SantaremPage extends StatelessWidget {
  static const String routeName = '/santarem_map';
  final String _title = 'Santarém';
  const SantaremPage({Key key});

  List<Container> _buildMap() {
    final map = <Container>[];
    for (int i = 0; i < 10; i++) {
      map.add(
        Container(
          decoration: BoxDecoration(
            color: Colors.teal[200],
            border: Border.all(width: 0.5, color: Colors.black),
          ),
        ),
      );
    }
    return map;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_title)),
      body: Map2(),
    );
  }
}
