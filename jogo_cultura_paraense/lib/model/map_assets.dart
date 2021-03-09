class MapAssets {
  final String info;
  final String image;

  MapAssets({this.info, this.image});

  @override
  String toString() {
    return 'Entry{info: $info, image: $image}';
  }



  MapAssets.fromJson(Map<String, dynamic> json)
      : info = json['info'],
        image = json['image'];

  Map<String, dynamic> toJson() => {
    'info': info,
    'image': image
  };

  static List<MapAssets> fromJsonList(List<dynamic> jsonList) {
    final list = <MapAssets>[];
    for (Map<String, dynamic> json in jsonList) {
      list.add(MapAssets.fromJson(json));
    }
    return list;
  }

  static List<Map<String, dynamic>> toJsonList(List<MapAssets> topicsList) {
    final list = <Map<String, dynamic>>[];
    for (MapAssets topic in topicsList) {
      list.add(topic.toJson());
    }
    return list;
  }
}

