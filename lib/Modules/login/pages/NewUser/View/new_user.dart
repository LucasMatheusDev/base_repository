import 'package:delivery_of_all/Modules/login/Core/Helpers/Validator.dart';
import 'package:delivery_of_all/Modules/login/pages/NewUser/Model/new_user.dart';
import 'package:delivery_of_all/Modules/login/pages/NewUser/ViewModel/register_viewmodel.dart';
import 'package:flutter/material.dart';

class NewUser extends StatefulWidget {
  const NewUser({Key? key}) : super(key: key);

  @override
  _NewUserState createState() => _NewUserState();
}

class _NewUserState extends State<NewUser> {
  static const List listGenero = ['Masculino', 'Feminino'];
  final UserRegister _newUser = UserRegister();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final double _spaceBetweenForm = 20;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController passwordConfirm = TextEditingController();
  Object? newValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: _spaceBetweenForm),
                TextFormField(
                  onSaved: (newValue) => _newUser.name = newValue,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'O Campo não pode estar vazio';
                    } else if (value.trim().split(' ').length <= 1) {
                      return 'Digite um Nome Valido, Com nome e sobrenome';
                    } else {}
                  },
                  controller: name,
                  decoration: InputDecoration(
                      hintText: "digite seu Nome e sobrenome",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelText: "Nome Completo"),
                ),
                SizedBox(height: _spaceBetweenForm),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "O campo não pode estar vazio";
                    }
                    if (value.length < 9) {
                      return "Numero digitado incorretamente";
                    }
                    if (!value.startsWith("9")) {
                      return "Verifique se o numero está correto";
                    }
                  },
                  onSaved: (newValue) => _newUser.phone = newValue,
                  controller: phone,
                  decoration: InputDecoration(
                      hintText: "11 9999-9999",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelText: "Celular"),
                ),
                SizedBox(height: _spaceBetweenForm),
                TextFormField(
                  onSaved: (newValue) => _newUser.email = newValue,
                  controller: email,
                  validator: (value) {
                    if (Validator().emailValid(value.toString())) {
                    } else {
                      return "Email invalido";
                    }
                  },
                  decoration: InputDecoration(
                      hintText: "digite seu e-mail",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelText: "Email"),
                ),
                SizedBox(height: _spaceBetweenForm),
                DropdownButtonFormField(
                  dropdownColor: Colors.white,
                  iconEnabledColor: Colors.black,
                  iconDisabledColor: Colors.black,
                  onChanged: (newValue) {
                    _newUser.gender = newValue.toString();
                  },
                  hint: const Text(
                    'Género',
                    style: TextStyle(color: Colors.black),
                  ),
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.black,
                  ),
                  items: listGenero.map(
                    (value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Text(
                          value.toString(),
                          style: const TextStyle(color: Colors.black),
                        ),
                      );
                    },
                  ).toList(),
                ),
                SizedBox(height: _spaceBetweenForm),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Senha Vazia";
                    }
                    if (value.length <= 7) {
                      return "Senha muito curta";
                    }
                  },
                  onSaved: (newValue) => _newUser.password = newValue,
                  controller: password,
                  decoration: InputDecoration(
                      hintText: "digite sua senha",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelText: "Senha"),
                ),
                SizedBox(height: _spaceBetweenForm),
                TextFormField(
                  validator: (value) {
                    if (value == password.text) {
                    } else {
                      return "Senhas Incompatíveis";
                    }
                  },
                  controller: passwordConfirm,
                  decoration: InputDecoration(
                      hintText: "digite sua senha novamente",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelText: "Confirme a senha"),
                ),
                SizedBox(height: _spaceBetweenForm),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      await RegisterViewModel().register(_newUser);
                    }
                  },
                  child: const Text("Finalizar"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
