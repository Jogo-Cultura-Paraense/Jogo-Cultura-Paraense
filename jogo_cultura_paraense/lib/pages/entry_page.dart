import 'package:flutter/material.dart';
import 'package:jogo_cultura_paraense/model/Eentry.dart';

class EntryPage extends StatelessWidget {
  final Eentry entry;
  const EntryPage({this.entry});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(entry.title),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(32.0),
            child: SingleChildScrollView(
              child: Text(entry.body),
            ),
          ),
        ],
      ),
    );
  }
}
