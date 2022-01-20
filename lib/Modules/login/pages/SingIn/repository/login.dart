import 'package:delivery_of_all/Modules/login/pages/SingIn/Model/user_sing_in.dart';
import 'package:delivery_of_all/Modules/login/pages/SingIn/ViewModel/sing_in_viewmodel.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> singIn(UserSingIn _user) async {
    await _auth
        .signInWithEmailAndPassword(
      email: _user.email,
      password: _user.password,
    )
        .then((_value) {
      SingInViewModel().userAuthentic(_value);
    }).catchError(
      (e) {
        SingInViewModel().userError(e.code.toString());
      },
    );
  }
}
