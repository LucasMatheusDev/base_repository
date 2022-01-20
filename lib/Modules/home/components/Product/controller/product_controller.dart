import 'package:delivery_of_all/Modules/home/components/Product/Model/product_model.dart';
import 'package:delivery_of_all/Modules/home/components/Product/ViewModel/product_view_model.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  static ProductController get to => Get.find();
  List<ProductModel> products = [];
  Future<void> getProducts() async {
    await ProductViewModel().getProduct().then((value) {
      products = value;
      update();
    });
  }
}
