import 'package:flutter/material.dart';
import 'package:jogo_cultura_paraense/model/Eentry.dart';
import 'package:jogo_cultura_paraense/pages/entry_page.dart';

class ListEntries extends StatefulWidget {
  final List<ETopic> entries;
  final String filter;

  const ListEntries({
    Key key,
    this.entries,
    this.filter,
  }) : super(key: key);

  @override
  ListEntriesState createState() => ListEntriesState();
}

class ListEntriesState extends State<ListEntries> {
  @override
  Widget build(BuildContext context) {
    // The list after filter apply
    List<ETopic> filteredList = List<ETopic>();

    // There is some filter?
    if (widget.filter.isNotEmpty) {
      for (dynamic entry in widget.entries) {
        // Check if theres this filter in the current item
        String title = entry.toString().toLowerCase();
        String title2 = entry.title.toLowerCase();

        if ('${title2[0]}' == widget.filter.toLowerCase()) {
          print(title);
          filteredList.add(entry);
        }
        else if (widget.filter.toLowerCase().length > 1 && title.contains(widget.filter.toLowerCase())) {
          filteredList.add(entry);
        }
      }
    } else {
      //for (dynamic entry in widget.entries) {
     //  print(entry.unlocked);
      //}
      filteredList.addAll(widget.entries);
    }

    // Empty after filters
    if (filteredList.isEmpty) {
      return ListView(
        shrinkWrap: true,
        children: <Widget>[
          ListTile(title: Text('Não foram encontrados registros iniciando por essa letra. Jogue mais para desbloquear.')),
        ],
      );
    }

    return ListView.builder(
      itemCount: filteredList.length,
      itemBuilder: (context, index) {
        ETopic listentry = filteredList[index];
        return _EntryItem(
          listentry,
          onClick: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => EntryPage(entry: listentry),
              ),
            );
          },
        );
      },
    );
  }
}

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
          entry.body.substring(0, 40) + '...',
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}
