import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jogo_cultura_paraense/bloc/bloc.dart';
import 'package:jogo_cultura_paraense/bloc/encyclopedia/encyclopedia_bloc.dart';
import 'package:jogo_cultura_paraense/components/loading_progress.dart';
import 'package:jogo_cultura_paraense/components/save/save_selection.dart';
import 'package:jogo_cultura_paraense/model/encyclopedia_entry.dart';
import 'package:jogo_cultura_paraense/pages/entry_page.dart';

class EncyclopediaPage extends StatelessWidget {
  static const String routeName = '/encyclopedia';

  const EncyclopediaPage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SaveSelection(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Enciclopédia'),
        ),
        body: const EncyclopediaAssets(),
      ),
    );
  }
}

class EncyclopediaAssets extends StatelessWidget {
  const EncyclopediaAssets({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Wait for widget to load then send event
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      BlocProvider.of<EncyclopediaBloc>(context).add(LoadEncyclopedia());
    });

    return BlocConsumer<EncyclopediaBloc, EncyclopediaState>(
      builder: (context, state) {
        if (state is EncyclopediaLoaded) {
          return EncyclopediaSave(state.entries);
        }
        return LoadingProgress(
          loadingFailed: state is EncyclopediaFailed,
          retryColor: Theme.of(context).primaryColor,
          retryCallBack: () {
            BlocProvider.of<EncyclopediaBloc>(context).add(LoadEncyclopedia());
          },
        );
      },
      listenWhen: (previousState, currentState) {
        return currentState is EncyclopediaFailed;
      },
      listener: (context, state) {
        if (state is EncyclopediaFailed) {
          Scaffold.of(context).showSnackBar(
            SnackBar(content: Text(state.error)),
          );
        }
      },
    );
  }
}

class EncyclopediaSave extends StatelessWidget {
  final List<EncyclopediaEntry> _entries;
  const EncyclopediaSave(List<EncyclopediaEntry> entries, {Key key})
      : _entries = entries,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SaveBloc, SaveState>(
      buildWhen: (previousState, currentState) {
        if (previousState.currentSave != currentState.currentSave) {
          return true;
        }
        return false;
      },
      builder: (context, dynamic state) {
        return Encyclopedia(
          entries: _entries,
          viewableEntries: List<String>.generate(
            state.currentSave.itensSave.length,
            (int index) => state.currentSave.itensSave[index],
          ),
        );
      },
    );
  }
}

class Encyclopedia extends StatefulWidget {
  final List<String> _viewableEntries;
  final List<EncyclopediaEntry> _entries;
  const Encyclopedia(
      {@required List<EncyclopediaEntry> entries,
      @required viewableEntries,
      Key key})
      : _viewableEntries = viewableEntries,
        _entries = entries,
        super(key: key);

  @override
  _EncyclopediaState createState() => _EncyclopediaState();
}

class _EncyclopediaState extends State<Encyclopedia> {
  List<EncyclopediaEntry> filteredEntries;

  @override
  void initState() {
    filteredEntries = widget._entries;
    super.initState();
  }

  void _searchEntries(String search) {
    if (search == null || search == '') {
      setState(() {
        filteredEntries = widget._entries;
      });
    } else {
      final newFilteredEntries = <EncyclopediaEntry>[];
      for (EncyclopediaEntry entry in filteredEntries) {
        if (entry.title.toLowerCase().startsWith(search.toLowerCase())) {
          newFilteredEntries.add(entry);
        }
      }
      setState(() {
        filteredEntries = newFilteredEntries;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 10.0, right: 10.0, left: 10.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Pesquisar',
                  ),
                  onChanged: (value) => _searchEntries(value),
                ),
              ),
              IconButton(
                icon: Icon(Icons.filter_list),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Container(
                        height: 180,
                        width: MediaQuery.of(context).size.width,
                        child: Text('Aqui'),
                        decoration: BoxDecoration(
                          color: Theme.of(context).canvasColor,
                          borderRadius: BorderRadius.only(
                            topLeft: const Radius.circular(25),
                            topRight: const Radius.circular(25),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: filteredEntries.length,
            itemBuilder: (context, index) {
              // print(filteredEntries);
              if (widget._viewableEntries
                  .contains(filteredEntries[index].title)) {
                return ViewableEntry(entry: filteredEntries[index]);
              } else {
                return ViewlessEntry(entry: filteredEntries[index]);
              }
            },
          ),
        ),
      ],
    );
  }
}

class EntryTile extends StatelessWidget {
  final EncyclopediaEntry _entry;
  const EntryTile({@required EncyclopediaEntry entry, Key key})
      : _entry = entry,
        super(key: key);

  void onTap(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onTap(context);
      },
      title: Text(
        _entry.title,
        style: TextStyle(
          fontSize: 24.0,
        ),
      ),
      subtitle: Text(
        _entry.body.substring(0, 40) + '...',
        style: TextStyle(
          fontSize: 16.0,
        ),
      ),
    );
  }
}

class ViewableEntry extends EntryTile {
  const ViewableEntry({@required EncyclopediaEntry entry, Key key})
      : super(entry: entry, key: key);

  @override
  void onTap(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => EncyclopediaEntryPage(entry: _entry),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(child: super.build(context));
  }
}

class ViewlessEntry extends EntryTile {
  const ViewlessEntry({@required EncyclopediaEntry entry, Key key})
      : super(entry: entry, key: key);

  @override
  void onTap(BuildContext context) {
    showDialog(
      context: context,
      child: const SimpleDialog(
        children: <Widget>[
          Text('Jogue mais para desbloquear esse item'),
        ],
      ),
    );
  }
}
