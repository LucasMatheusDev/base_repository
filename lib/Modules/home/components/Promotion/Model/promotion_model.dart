import 'package:cloud_firestore/cloud_firestore.dart';

class PromotionModel {
  String? imagePromotion;
  List<String>? imageProduct;
  String? description;
  String? id;
  String? name;
  int? value;
  int? stock;
  PromotionModel.fromDocument(QueryDocumentSnapshot doc) {
    imagePromotion = doc["imagePromotion"] as String;
    imageProduct = List.from(doc["imageProduct"] as List<dynamic>);
    description = doc["description"] as String;
    id = doc.id.toString();
    name = doc["name"] as String;
    value = doc["value"] as int;
    stock = doc["stock"] as int;
  }
  bool get hasStock => stock! > 0;
}
