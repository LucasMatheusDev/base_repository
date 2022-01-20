import 'package:carousel_slider/carousel_slider.dart';
import 'package:delivery_of_all/Modules/home/components/Promotion/Controller/promotion_controller.dart';
import 'package:flutter/material.dart';

class PromotionWidget extends StatelessWidget {
  const PromotionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: PromotionController.to.loadPromotions(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return CarouselSlider(
              carouselController: CarouselControllerImpl(),
              options: CarouselOptions(
                viewportFraction: 1.0,
                enlargeCenterPage: true,
                autoPlay: true,
              ),
              items: PromotionController.to.promotions.map(
                (promo) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      image: DecorationImage(
                        image: NetworkImage(
                          promo.imagePromotion.toString(),
                        ),
                        fit: BoxFit.contain,
                      ),
                    ),
                    child: const Align(
                        alignment: Alignment.bottomCenter,
                        child: Text("Aproveite")),
                  );
                },
              ).toList(),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
        });
  }
}
