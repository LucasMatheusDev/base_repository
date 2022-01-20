import 'package:delivery_of_all/Modules/home/components/Promotion/Model/promotion_model.dart';
import 'package:delivery_of_all/Modules/home/components/Promotion/repository/promotion_repository.dart';

class PromotionViewModel {
  Future<List<PromotionModel>> promotion() async {
    final _result = await PromotionRepository().getPromotions();
    final List<PromotionModel> _promotions =
        _result.docs.map((p) => PromotionModel.fromDocument(p)).toList();
    return _promotions;
  }
}
