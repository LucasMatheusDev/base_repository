import 'package:delivery_of_all/Modules/home/Core/page/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Modules/Core/company_information/company_info.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //inicialização do Firebase nova versão
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              CompanyInfo().color10,
            ),
          ),
        ),
        primarySwatch: CompanyInfo().color60,
      ),
      home: const HomePage(),
    );
  }
}
