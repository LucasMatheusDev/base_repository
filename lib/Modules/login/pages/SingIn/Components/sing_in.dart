import 'package:delivery_of_all/Modules/login/Core/Helpers/Validator.dart';
import 'package:delivery_of_all/Modules/login/pages/SingIn/Model/user_sing_in.dart';
import 'package:delivery_of_all/Modules/login/pages/SingIn/ViewModel/sing_in_viewmodel.dart';
import 'package:delivery_of_all/Modules/login/pages/SingIn/controller/loading_login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SingIn extends StatefulWidget {
  const SingIn({Key? key}) : super(key: key);

  @override
  _SingInState createState() => _SingInState();
}

class _SingInState extends State<SingIn> {
  final GlobalKey<FormState> _singInFormkey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _singInFormkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Icon(Icons.food_bank),
                const SizedBox(height: 50),
                TextFormField(
                  validator: (value) {
                    if (Validator().emailValid(value.toString())) {
                    } else {
                      return "Email invalido";
                    }
                  },
                  controller: email,
                  decoration: InputDecoration(
                      hintText: "digite seu e-mail",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelText: "Email"),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Insira a senha";
                    }
                  },
                  obscureText: true,
                  controller: password,
                  decoration: InputDecoration(
                      hintText: "digite sua senha",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelText: "senha"),
                ),
                const SizedBox(height: 20),
                Obx(
                  () => LoadingLoginController.isLoading.value
                      ? const CircularProgressIndicator()
                      : ElevatedButton(
                          onPressed: () async {
                            if (_singInFormkey.currentState!.validate()) {
                              final UserSingIn _user = UserSingIn(
                                  email: email.text, password: password.text);
                              SingInViewModel().singIn(_user);
                            }
                          },
                          child: const Text("Entrar"),
                        ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void customSnack(SnackBar snackBar) {
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
