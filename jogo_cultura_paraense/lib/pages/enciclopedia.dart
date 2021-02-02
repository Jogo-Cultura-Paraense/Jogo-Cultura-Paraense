import 'package:flutter/material.dart';
import 'package:jogo_cultura_paraense/components/progress.dart';
import 'package:jogo_cultura_paraense/model/Eentry.dart';
import 'package:jogo_cultura_paraense/pages/entry_page.dart';
import 'package:jogo_cultura_paraense/repositories/datocms_repository.dart';
import 'package:jogo_cultura_paraense/services/list_entries.dart';
import 'package:jogo_cultura_paraense/services/search_bar.dart';

class Enciclopedia extends StatefulWidget {
  @override
  _EnciclopediaState createState() => _EnciclopediaState();
}

class _EnciclopediaState extends State<Enciclopedia> {
  final DatoCMSRepository _dao = DatoCMSRepository();

  String filterTest = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Enciclopédia"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            color: Color.fromRGBO(230, 230, 230, 0.5),
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width - 80,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Pesquisar',
                    ),
                    onChanged: (text) {
                      setState(() {
                        filterTest = text;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: FutureBuilder<List<ETopic>>(
              initialData: List(),
              future: fetchEntries(),
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
                    final List<ETopic> entries = snapshot.data;
                    return ListEntries(
                      entries: entries,
                      filter: filterTest,
                    );
                    break;
                }
                return Text('Erro desconhecido');
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<List<ETopic>> fetchEntries() async {
    try {
      final String query = '''
        query entryenc{
          allEntryencs{
            title
            body
          }
        }
      ''';
      var result = await _dao.query(query, data: 'allEntryencs');
      return ETopic.fromJsonList(result);
    } catch (error) {
      throw Exception(error.toString());
    }
  }
}
/* 
class _EntryItem extends StatelessWidget {
  final ETopic entry;
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
        isThreeLine: true,
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
 */
