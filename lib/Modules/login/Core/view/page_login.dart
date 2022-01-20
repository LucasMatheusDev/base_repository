import 'package:delivery_of_all/Modules/Core/company_information/company_info.dart';
import 'package:delivery_of_all/Modules/login/Core/controller/tabView/manager_tabviews.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageLogin extends StatefulWidget {
  const PageLogin({Key? key}) : super(key: key);

  @override
  _PageLoginState createState() => _PageLoginState();
}

class _PageLoginState extends State<PageLogin> with TickerProviderStateMixin {
  final RxBool animation = false.obs;
  final RxBool animation2 = false.obs;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TabController tabController = TabController(length: 2, vsync: this);
    return Scaffold(
      primary: false,
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              color: CompanyInfo().color60,
            ),
            SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Obx(
                    () => AnimatedContainer(
                      curve: Curves.ease,
                      duration: const Duration(seconds: 1),
                      padding: const EdgeInsets.all(20),
                      height: animation.value
                          ? size.height - 120
                          : size.height / 13,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(100),
                          topRight: Radius.circular(100),
                        ),
                      ),
                      child: Column(
                        children: [
                          InkWell(
                            splashColor: CompanyInfo().color10,
                            highlightColor: CompanyInfo().color10,
                            child: Container(
                              height: 8,
                              width: 80,
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            onTap: () async {
                              animation.value = !animation.value;
                              await Future.delayed(
                                const Duration(milliseconds: 600),
                              );
                              animation2.value = !animation2.value;
                            },
                          ),
                          SizedBox(
                            height: animation2.value ? 30 : 0,
                          ),
                          if (animation2.value)
                            TabBar(
                              indicatorSize: TabBarIndicatorSize.label,
                              controller: tabController,
                              tabs: const [
                                Text(
                                  "Login",
                                  style: TextStyle(color: Colors.black),
                                ),
                                Text(
                                  "Registrar",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            )
                          else
                            Container(),
                          if (animation2.value)
                            Expanded(
                              child: ManagerTabViewLogin(
                                  tabController: tabController),
                            )
                          else
                            Container(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
