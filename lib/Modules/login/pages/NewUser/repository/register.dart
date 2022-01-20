import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_of_all/Modules/login/pages/NewUser/Model/new_user.dart';
import 'package:delivery_of_all/Modules/login/pages/NewUser/ViewModel/register_viewmodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class Register {
  Future<void> newUser(UserRegister _newUser) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;

    await _auth
        .createUserWithEmailAndPassword(
      email: _newUser.email.toString(),
      password: _newUser.password.toString(),
    )
        .then((_userCredential) async {
      await saveNewUser(newUser: _newUser, credential: _userCredential);
      RegisterViewModel().newUserSuccess(_userCredential);
    }).catchError(
      (e) {
        RegisterViewModel().newUserFailed(
          e.code.toString(),
        );
      },
    );
  }

  Future<void> saveNewUser(
      {required UserRegister newUser,
      required UserCredential credential}) async {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    try {
      _firestore.collection("user").doc(credential.user!.uid).set(
            newUser.toMap(),
          );
    } on Exception catch (_) {
      Get.snackbar(
        "Erro ao se cadastrar",
        "Abra e feche o app e tente novamente",
        duration: const Duration(seconds: 1),
      );
      throw Exception();
    }
  }

  Future<void> infoAdditional(UserRegister _newUser) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    if (_auth.currentUser != null) {
      _auth.currentUser!.updateDisplayName(_newUser.name);
    }
  }

  Future<void> verifyPhone(UserRegister _newUser) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    await _auth.verifyPhoneNumber(
      phoneNumber: _newUser.phone.toString(),
      verificationCompleted: (PhoneAuthCredential credential) async {
        await infoAdditional(_newUser);
      },
      verificationFailed: (FirebaseException e) {
        if (e.code == 'invalid-phone-number') {
          Get.snackbar("Erro", "O numero fornecido é invalido");
        }
      },
      codeSent: (String verificationId, int? resendToken) {},
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }
}
