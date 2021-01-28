import 'package:flutter/material.dart';
import 'package:jogo_cultura_paraense/components/progress.dart';
import 'package:jogo_cultura_paraense/model/Eentry.dart';
import 'package:jogo_cultura_paraense/pages/entry_page.dart';
import 'package:jogo_cultura_paraense/repositories/datocms_repository.dart';

/* class Enciclopedia extends StatefulWidget {
  @override
  _EnciclopediaState createState() => _EnciclopediaState();
}

class _EnciclopediaState extends State<Enciclopedia> { */
class Enciclopedia extends StatelessWidget {
  final DatoCMSRepository _dao = DatoCMSRepository();
  final String query = '''
        query homeasset{
          homeasset {
            Bg {
              url
            }
            Info
          }
        }
      ''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Eentry>>(
        initialData: List(),
        future: _dao.query(query),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Progress();
              break;
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              final List<Eentry> entries = snapshot.data;
              return ListView.builder(
                itemBuilder: (context, index) {
                  final Eentry entry = entries[index];
                  return _EntryItem(
                    entry,
                    onClick: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => EntryPage(entry: entry),
                        ),
                      );
                    },
                  );
                },
                itemCount: entries.length,
              );
              break;
          }
          return Text('Erro desconhecido');
        },
      ),
    );
  }
}

class _EntryItem extends StatelessWidget {
  final Eentry entry;
  final Function onClick;

  _EntryItem(
    this.entry, {
    @required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () => onClick(),
        title: Text(
          entry.title,
          style: TextStyle(
            fontSize: 24.0,
          ),
        ),
        subtitle: Text(
          entry.body,
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}
