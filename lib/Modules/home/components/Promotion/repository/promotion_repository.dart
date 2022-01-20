import 'package:cloud_firestore/cloud_firestore.dart';

class PromotionRepository {
  Future<QuerySnapshot<Map<String, dynamic>>> getPromotions() async {
    final FirebaseFirestore _db = FirebaseFirestore.instance;
    const String _promotion = "promotion";
    final QuerySnapshot<Map<String, dynamic>> _result =
        await _db.collection(_promotion).get();

    return _result;
  }
}
