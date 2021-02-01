class ETopic {
  final String title;
  final String body;
  bool isUnlocked;

  ETopic({this.title, this.body, this.isUnlocked});

  @override
  String toString() {
    return 'Entry{title: $title, body: $body}';
  }

  ETopic.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        body = json['body'];

  Map<String, dynamic> toJson() => {
        'title': title,
        'body': body,
      };

  static List<ETopic> fromJsonList(List<dynamic> jsonList) {
    final list = <ETopic>[];
    for (Map<String, dynamic> json in jsonList) {
      list.add(ETopic.fromJson(json));
    }
    return list;
  }

  static List<Map<String, dynamic>> toJsonList(List<ETopic> topicsList) {
    final list = <Map<String, dynamic>>[];
    for (ETopic topic in topicsList) {
      list.add(topic.toJson());
    }
    return list;
  }
}
