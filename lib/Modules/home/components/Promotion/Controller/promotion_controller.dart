import 'package:delivery_of_all/Modules/home/components/Promotion/Model/promotion_model.dart';
import 'package:delivery_of_all/Modules/home/components/Promotion/ViewModel/promotion.viewmodel.dart';
import 'package:get/get.dart';

class PromotionController extends GetxController {
  static final PromotionController to = Get.put(PromotionController());
  List<PromotionModel> promotions = [];

  Future<void> loadPromotions() async {
    promotions = await PromotionViewModel().promotion();
    update();
  }
}
