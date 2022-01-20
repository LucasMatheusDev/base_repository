import 'package:delivery_of_all/Modules/home/components/Promotion/View/promotion_widget.dart';
import 'package:delivery_of_all/Modules/login/pages/NewUser/Model/new_user.dart';
import 'package:delivery_of_all/Modules/login/pages/NewUser/repository/register.dart';
import 'package:delivery_of_all/Modules/login/pages/SingIn/repository/helper/verify_error_login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class RegisterViewModel {
  Future register(UserRegister _newUser) async {
    await Register().newUser(_newUser);
  }

  void newUserSuccess(UserCredential _userCredential) {
    if (_userCredential.user != null) {
      Get.to(
        () => const PromotionWidget(),
      );
    }
  }

  void newUserFailed(String error) {
    Get.snackbar(
        "Erro",
        VerifyErrorLogin().verifyError(
          "auth/$error",
        ),
        snackPosition: SnackPosition.BOTTOM);
  }
}
