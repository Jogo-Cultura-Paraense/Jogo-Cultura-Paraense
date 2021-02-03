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
  String initialLetter = "";
  bool keyboardFilter = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                    return ListEntries(entries: entries, filter: filterTest);
                    break;
                }
                return Text('Erro desconhecido');
              },
            ),
          ),
          Container(
            color: Colors.black12,
            child: Column(
              children: <Widget>[
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  ButtonTheme(
                    minWidth: 10.0,
                    buttonColor: Colors.red[700],
                    child: RaisedButton(
                      onPressed: () {
                        setState(() {
                          this.filterTest = 'A';
                        });
                      },
                      shape: CircleBorder(),
                      child: Text('A'),
                    ),
                  ),
                  ButtonTheme(
                    minWidth: 10.0,
                    buttonColor: Colors.red[700],
                    child: RaisedButton(
                      onPressed: () {
                        setState(() {
                          this.filterTest = 'B';
                        });
                      },
                      shape: CircleBorder(),
                      child: Text('B'),
                    ),
                  ),
                  ButtonTheme(
                    minWidth: 10.0,
                    buttonColor: Colors.red[700],
                    child: RaisedButton(
                      onPressed: () {
                        setState(() {
                          this.filterTest = 'C';
                        });
                      },
                      shape: CircleBorder(),
                      child: Text('C'),
                    ),
                  ),
                  ButtonTheme(
                    minWidth: 10.0,
                    buttonColor: Colors.red[700],
                    child: RaisedButton(
                      onPressed: () {
                        setState(() {
                          this.filterTest = 'D';
                        });
                      },
                      shape: CircleBorder(),
                      child: Text('D'),
                    ),
                  ),
                  ButtonTheme(
                    minWidth: 10.0,
                    buttonColor: Colors.red[700],
                    child: RaisedButton(
                      onPressed: () {
                        setState(() {
                          this.filterTest = 'E';
                        });
                      },
                      shape: CircleBorder(),
                      child: Text('E'),
                    ),
                  ),
                  ButtonTheme(
                    minWidth: 10.0,
                    buttonColor: Colors.red[700],
                    child: RaisedButton(
                      onPressed: () {
                        setState(() {
                          this.filterTest = 'F';
                        });
                      },
                      shape: CircleBorder(),
                      child: Text('F'),
                    ),
                  ),
                  ButtonTheme(
                    minWidth: 10.0,
                    buttonColor: Colors.red[700],
                    child: RaisedButton(
                      onPressed: () {
                        setState(() {
                          this.filterTest = 'G';
                        });
                      },
                      shape: CircleBorder(),
                      child: Text('G'),
                    ),
                  ),
                  ButtonTheme(
                    minWidth: 10.0,
                    buttonColor: Colors.red[700],
                    child: RaisedButton(
                      onPressed: () {
                        setState(() {
                          this.filterTest = 'H';
                        });
                      },
                      shape: CircleBorder(),
                      child: Text('H'),
                    ),
                  ),
                ]),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  ButtonTheme(
                    minWidth: 10.0,
                    buttonColor: Colors.red[700],
                    child: RaisedButton(
                      onPressed: () {
                        setState(() {
                          this.filterTest = 'I';
                        });
                      },
                      shape: CircleBorder(),
                      child: Text('I'),
                    ),
                  ),
                  ButtonTheme(
                    minWidth: 10.0,
                    buttonColor: Colors.red[700],
                    child: RaisedButton(
                      onPressed: () {
                        setState(() {
                          this.filterTest = 'J';
                        });
                      },
                      shape: CircleBorder(),
                      child: Text('J'),
                    ),
                  ),
                  ButtonTheme(
                    minWidth: 10.0,
                    buttonColor: Colors.red[700],
                    child: RaisedButton(
                      onPressed: () {
                        setState(() {
                          this.filterTest = 'L';
                        });
                      },
                      shape: CircleBorder(),
                      child: Text('L'),
                    ),
                  ),
                  ButtonTheme(
                    minWidth: 10.0,
                    buttonColor: Colors.red[700],
                    child: RaisedButton(
                      onPressed: () {
                        setState(() {
                          this.filterTest = 'M';
                        });
                      },
                      shape: CircleBorder(),
                      child: Text('M'),
                    ),
                  ),
                  ButtonTheme(
                    minWidth: 10.0,
                    buttonColor: Colors.red[700],
                    child: RaisedButton(
                      onPressed: () {
                        setState(() {
                          this.filterTest = 'N';
                        });
                      },
                      shape: CircleBorder(),
                      child: Text('N'),
                    ),
                  ),
                  ButtonTheme(
                    minWidth: 10.0,
                    buttonColor: Colors.red[700],
                    child: RaisedButton(
                      onPressed: () {
                        setState(() {
                          this.filterTest = 'O';
                        });
                      },
                      shape: CircleBorder(),
                      child: Text('O'),
                    ),
                  ),
                  ButtonTheme(
                    minWidth: 10.0,
                    buttonColor: Colors.red[700],
                    child: RaisedButton(
                      onPressed: () {
                        setState(() {
                          this.filterTest = 'P';
                        });
                      },
                      shape: CircleBorder(),
                      child: Text('P'),
                    ),
                  ),
                  ButtonTheme(
                    minWidth: 10.0,
                    buttonColor: Colors.red[700],
                    child: RaisedButton(
                      onPressed: () {
                        setState(() {
                          this.filterTest = 'Q';
                        });
                      },
                      shape: CircleBorder(),
                      child: Text('Q'),
                    ),
                  ),
                ]),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  ButtonTheme(
                    minWidth: 10.0,
                    buttonColor: Colors.red[700],
                    child: RaisedButton(
                      onPressed: () {
                        setState(() {
                          this.filterTest = 'R';
                        });
                      },
                      shape: CircleBorder(),
                      child: Text('R'),
                    ),
                  ),
                  ButtonTheme(
                    minWidth: 10.0,
                    buttonColor: Colors.red[700],
                    child: RaisedButton(
                      onPressed: () {
                        setState(() {
                          this.filterTest = 'S';
                        });
                      },
                      shape: CircleBorder(),
                      child: Text('S'),
                    ),
                  ),
                  ButtonTheme(
                    minWidth: 10.0,
                    buttonColor: Colors.red[700],
                    child: RaisedButton(
                      onPressed: () {
                        setState(() {
                          this.filterTest = 'T';
                        });
                      },
                      shape: CircleBorder(),
                      child: Text('T'),
                    ),
                  ),
                  ButtonTheme(
                    minWidth: 10.0,
                    buttonColor: Colors.red[700],
                    child: RaisedButton(
                      onPressed: () {
                        setState(() {
                          this.filterTest = 'U';
                        });
                      },
                      shape: CircleBorder(),
                      child: Text('U'),
                    ),
                  ),
                  ButtonTheme(
                    minWidth: 10.0,
                    buttonColor: Colors.red[700],
                    child: RaisedButton(
                      onPressed: () {
                        setState(() {
                          this.filterTest = 'V';
                        });
                      },
                      shape: CircleBorder(),
                      child: Text('V'),
                    ),
                  ),
                  ButtonTheme(
                    minWidth: 10.0,
                    buttonColor: Colors.red[700],
                    child: RaisedButton(
                      onPressed: () {
                        setState(() {
                          this.filterTest = 'X';
                        });
                      },
                      shape: CircleBorder(),
                      child: Text('X'),
                    ),
                  ),
                  ButtonTheme(
                    minWidth: 10.0,
                    buttonColor: Colors.red[700],
                    child: RaisedButton(
                      onPressed: () {
                        setState(() {
                          this.filterTest = 'Z';
                        });
                      },
                      shape: CircleBorder(),
                      child: Text('Z'),
                    ),
                  ),
                ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ButtonTheme(
                      minWidth: 10.0,
                      buttonColor: Colors.red[700],
                      child: RaisedButton(
                        onPressed: () {
                          setState(() {
                            this.filterTest = '';
                          });
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.red)),
                        child: Text('Limpar Filtros'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<List<ETopic>> fetchEntries() async {
    try {
      final String query = '''
        query entryenc {
        allEntryencs(filter: {OR: {isunlocked: {eq: "true"}}} orderBy: [title_ASC]) {
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
