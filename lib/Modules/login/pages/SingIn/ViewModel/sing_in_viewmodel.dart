import 'package:delivery_of_all/Modules/home/components/Product/View/product_view.dart';
import 'package:delivery_of_all/Modules/login/pages/SingIn/Model/user_sing_in.dart';
import 'package:delivery_of_all/Modules/login/pages/SingIn/controller/loading_login_controller.dart';
import 'package:delivery_of_all/Modules/login/pages/SingIn/repository/helper/verify_error_login.dart';
import 'package:delivery_of_all/Modules/login/pages/SingIn/repository/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SingInViewModel {
  Future singIn(UserSingIn _user) async {
    LoadingLoginController.isLoading.value = true;
    await Login().singIn(_user);
  }

  void userAuthentic(UserCredential _credential) {
    if (_credential.user != null) {
      Get.to(
        () => //! tela inicial,
            const ProductView(),
        transition: Transition.fadeIn,
      );
      LoadingLoginController.isLoading.value = false;
    }
    LoadingLoginController.isLoading.value = false;
  }

  void userError(String error) {
    LoadingLoginController.isLoading.value = false;
    Get.snackbar(
      "Erro",
      VerifyErrorLogin().verifyError("auth/$error"),
      snackPosition: SnackPosition.BOTTOM,
      colorText: Colors.black,
    );
  }
}
