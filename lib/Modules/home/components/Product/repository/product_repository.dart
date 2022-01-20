import 'package:cloud_firestore/cloud_firestore.dart';

class ProductRepository {
  Future<QuerySnapshot<Map<String, dynamic>>> products() async {
    const String products = "product";
    final FirebaseFirestore _db = FirebaseFirestore.instance;
    final QuerySnapshot<Map<String, dynamic>> _result =
        await _db.collection(products).get();

    return _result;
  }
}
