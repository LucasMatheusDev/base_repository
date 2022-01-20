import 'package:delivery_of_all/Modules/home/components/Promotion/View/promotion_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: const [
              AspectRatio(
                aspectRatio: 2,
                child: PromotionWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
