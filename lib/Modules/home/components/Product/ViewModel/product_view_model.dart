import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_of_all/Modules/home/components/Product/Model/product_model.dart';
import 'package:delivery_of_all/Modules/home/components/Product/repository/product_repository.dart';

class ProductViewModel {
  Future<List<ProductModel>> getProduct() async {
    List<ProductModel> _allProducts = [];
    final QuerySnapshot<Map<String, dynamic>> _result =
        await ProductRepository().products();
    if (_result.docs.isNotEmpty) {
      _allProducts =
          _result.docs.map((p) => ProductModel.fromDocument(p)).toList();
    }
    return _allProducts;
  }
}
