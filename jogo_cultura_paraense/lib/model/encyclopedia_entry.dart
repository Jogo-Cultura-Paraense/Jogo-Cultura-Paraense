class EncyclopediaEntry {
  final String title;
  final String body;

  EncyclopediaEntry({this.title, this.body});

  @override
  String toString() {
    return 'Entry{title: $title, body: $body}';
  }

  factory EncyclopediaEntry.fromJson(Map<String, dynamic> json) {
    return EncyclopediaEntry(
      title: json['title'],
      body: json['body'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'title': title, 'body': body};
  }

  static List<EncyclopediaEntry> fromJsonList(List<dynamic> jsonList) {
    final list = <EncyclopediaEntry>[];
    for (Map<String, dynamic> json in jsonList) {
      list.add(EncyclopediaEntry.fromJson(json));
    }
    return list;
  }

  static List<Map<String, dynamic>> toJsonList(
    List<EncyclopediaEntry> entriesList,
  ) {
    final list = <Map<String, dynamic>>[];
    for (EncyclopediaEntry entry in entriesList) {
      list.add(entry.toJson());
    }
    return list;
  }
}
