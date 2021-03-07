import 'package:flutter/material.dart';
import 'package:jogo_cultura_paraense/components/save/save_selection.dart';
import 'package:jogo_cultura_paraense/pages/enciclopedia.dart';

class EnciclopediaPage extends StatelessWidget {
  static const String routeName = '/enciclopedia';

  const EnciclopediaPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SaveSelection(
      child: const Enciclopedia(),
    );
  }
}
