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
}
