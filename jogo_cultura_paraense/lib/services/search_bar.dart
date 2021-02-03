import 'package:flutter/material.dart';
import 'package:jogo_cultura_paraense/model/Eentry.dart';

class Search extends SearchDelegate {
  final List<ETopic> list;
  List<ETopic> completeList = [];
  ETopic selectedResult;

  Search(this.list);

  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          query = "";
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      child: Center(
        child: Text(selectedResult.title),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<ETopic> suggestionList = [];
    query.isEmpty
        ? suggestionList = completeList
        : suggestionList.addAll(
            list.where(
              (element) => element.title.contains(query),
            ),
          );
    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestionList[index].title),
          onTap: () {
            selectedResult = suggestionList[index];
            showResults(context);
          },
        );
      },
    );
  }
}
