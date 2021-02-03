class ETopic {
  final String title;
  final String body;
  final bool unlocked;

  ETopic({this.title, this.body, this.unlocked});

  @override
  String toString() {
    return 'Entry{title: $title, body: $body, unlocked: $unlocked}';
  }

  ETopic.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        body = json['body'],
        unlocked = json['unlocked'];

  Map<String, dynamic> toJson() => {
        'title': title,
        'body': body,
        'unlocked': unlocked
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
