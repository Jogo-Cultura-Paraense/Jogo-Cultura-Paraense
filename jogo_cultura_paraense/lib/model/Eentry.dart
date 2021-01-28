class Eentry {
  final String title;
  final String body;

  Eentry(this.title, this.body);

  @override
  String toString() {
    return 'Entry{title: $title, body: $body}';
  }

  Eentry.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        body = json['body'];

  Map<String, dynamic> toJson() => {
        'title': title,
        'body': body,
      };
}
