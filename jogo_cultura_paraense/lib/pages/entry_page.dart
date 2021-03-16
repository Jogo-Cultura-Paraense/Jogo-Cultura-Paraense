import 'package:flutter/material.dart';
import 'package:jogo_cultura_paraense/model/encyclopedia_entry.dart';

class EncyclopediaEntryPage extends StatelessWidget {
  final EncyclopediaEntry _entry;
  const EncyclopediaEntryPage({EncyclopediaEntry entry, Key key})
      : _entry = entry,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_entry.title),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(32.0),
            child: SingleChildScrollView(
              child: Text(_entry.body),
            ),
          ),
        ],
      ),
    );
  }
}
