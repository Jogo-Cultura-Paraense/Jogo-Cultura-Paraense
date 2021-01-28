class ItemSave {
  final String title;
  final String gameTitle;
  final bool isViewable;

  const ItemSave({this.title, this.gameTitle, this.isViewable = false});

  factory ItemSave.fromJson(Map<String, dynamic> json) {
    return ItemSave(
      title: json['title'],
      gameTitle: json['gameTitle'],
      isViewable: json['isViewable'],
    );
  }

  static List<ItemSave> fromJsonList(List<dynamic> jsonList) {
    final list = <ItemSave>[];
    for (Map<String, dynamic> json in jsonList) {
      list.add(ItemSave.fromJson(json));
    }
    return list;
  }

  static List<Map<String, dynamic>> toJsonList(List<ItemSave> itens) {
    final list = <Map<String, dynamic>>[];
    for (ItemSave item in itens) {
      list.add(item.toJson());
    }
    return list;
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'gameTitle': gameTitle,
      'isViewable': isViewable,
    };
  }
}
