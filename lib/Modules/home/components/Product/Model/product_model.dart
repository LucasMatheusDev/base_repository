import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  List<String>? images;
  String? name;
  String? id;
  String? description;
  String? category;
  bool? isFavorite;
  int? value;
  int? stock;
  int? sellers;
  int? commission;

  ProductModel.fromDocument(QueryDocumentSnapshot doc) {
    name = doc["name"].toString();
    id = doc.id.toString();
    value = doc["value"] as int;
    description = doc["description"] as String;
    images = List<String>.from(doc["images"] as List<dynamic>);
  }

  //   String toCapitalized() => name.length > 0 ?'${name.toUpperCase()}${substring(1)}': this.name;
  // String toTitleCase() => name.replaceAll(RegExp(' +'), ' ').split(' ').map((str) => str.toCapitalized()).join(' ');
}
