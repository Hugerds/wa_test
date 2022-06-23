import 'breeds.dart';

class Base {
  late String id;
  String? url;
  late int width;
  late int height;
  String? mimeType;
  late List<Breeds> breeds;

  Base({
    required this.id,
    this.url,
    required this.width,
    required this.height,
    this.mimeType,
    required this.breeds,
  });

  Base.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    width = json['width'];
    height = json['height'];
    // if (json['breeds'] != null) {
    breeds = <Breeds>[];
    for (var breed in json['breeds']) {
      breeds.add(Breeds.fromJson(breed));
    }
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['url'] = url;
    data['width'] = width;
    data['height'] = height;
    // if (breeds != null) {
    data['breeds'] = breeds.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}
