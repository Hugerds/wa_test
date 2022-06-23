import 'base.dart';

class Dog extends Base {
  Dog({required super.breeds, required super.height, required super.id, super.mimeType, super.url, required super.width});

  Dog.fromJson(Map<String, dynamic> json) : super.fromJson(json);

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = super.toJson();
    return data;
  }
}
