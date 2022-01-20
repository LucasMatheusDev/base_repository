import 'package:delivery_of_all/Modules/login/pages/NewUser/View/new_user.dart';
import 'package:delivery_of_all/Modules/login/pages/SingIn/Components/sing_in.dart';
import 'package:flutter/material.dart';

class ManagerTabViewLogin extends StatelessWidget {
  final TabController tabController;
  const ManagerTabViewLogin({Key? key, required this.tabController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: tabController,
      children: const [
        SingIn(),
        NewUser(),
      ],
    );
  }
}
