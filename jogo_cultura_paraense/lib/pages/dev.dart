import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jogo_cultura_paraense/bloc/save/save_bloc.dart';
import 'package:jogo_cultura_paraense/model/game_save.dart';
import 'package:jogo_cultura_paraense/model/map_save.dart';

class DevPage extends StatefulWidget {
  static const String routeName = '/dev';
  const DevPage({Key key}) : super(key: key);
  @override
  _DevPageState createState() => _DevPageState();
}

class _DevPageState extends State<DevPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _mapControl = TextEditingController();
  final TextEditingController _gameControl = TextEditingController();
  final TextEditingController _scoreControl = TextEditingController();
  final TextEditingController _itensControl = TextEditingController();

  final List<Region> _maps = <Region>[
    Maps.sudoeste,
    Maps.baixoAmazonas,
    Maps.sudeste,
    Maps.nordeste,
    Maps.marajo,
    Maps.metropolitana,
  ];

  final List<String> _games = <String>[
    Games.cooking,
    Games.archAndFestiv,
    Games.faunaAndFlora,
    Games.legendAndMyths,
    Games.vocabulary,
    Games.rhythms,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dev Mode')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(20.0),
          children: <Widget>[
            const Text(
              'Salvar jogo concluído',
              style: TextStyle(fontSize: 20.0),
              textAlign: TextAlign.center,
            ),
            DropdownButtonFormField(
              decoration: const InputDecoration(labelText: 'Map'),
              items: _maps.map<DropdownMenuItem>((Region region) {
                return DropdownMenuItem(
                  child: Text(region.name),
                  value: region.name,
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _mapControl.text = value;
                });
              },
              validator: (value) => value == null ? 'Obrigatório' : null,
            ),
            DropdownButtonFormField(
              decoration: const InputDecoration(labelText: 'Game'),
              items: _games.map<DropdownMenuItem>((String game) {
                return DropdownMenuItem(
                  child: Text(game),
                  value: game,
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _gameControl.text = value;
                });
              },
              validator: (value) => value == null ? 'Obrigatório' : null,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Score'),
              controller: _scoreControl,
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Itens',
                hintText: 'Separados por vírgula (,)',
              ),
              controller: _itensControl,
            ),
            Padding(
              padding: EdgeInsets.all(30.0),
              child: BlocConsumer<SaveBloc, SaveState>(
                builder: (context, state) {
                  if (state is SaveLoading) {
                    return CircularProgressIndicator();
                  }
                  return ElevatedButton(
                    child: Text('Salvar'),
                    onPressed: () {
                      if (_formKey.currentState.validate() == true) {
                        BlocProvider.of<SaveBloc>(context).add(
                          SaveClearedGame(
                            _mapControl.text,
                            _gameControl.text,
                            score: int.parse(_scoreControl.text),
                            itens: _itensControl.text.split(', '),
                          ),
                        );
                      }
                    },
                  );
                },
                listenWhen: (previousState, currentState) {
                  return currentState is SaveFailed;
                },
                listener: (context, state) {
                  if (state is SaveFailed) {
                    showDialog(
                      context: context,
                      child: SimpleDialog(
                        children: <Widget>[Text(state.error)],
                      ),
                    );
                  }
                },
              ),
            ),
            BlocBuilder<SaveBloc, SaveState>(
              builder: (context, state) {
                return Text(jsonEncode(state.currentSave.toJson()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
