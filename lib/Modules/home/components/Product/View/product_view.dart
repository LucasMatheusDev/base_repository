import 'package:delivery_of_all/Modules/home/components/Product/controller/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductView extends StatelessWidget {
  const ProductView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ProductController>(
          init: ProductController(),
          builder: (controller) {
            return FutureBuilder(
              future: ProductController().getProducts(),
              builder: (_, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return GridView.builder(
                    shrinkWrap: true,
                    itemCount: controller.products.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Obx(
                            () => Text(
                              controller.products.length.toString(),
                              style: const TextStyle(color: Colors.black),
                            ),
                          ),
                          Text(
                            controller.products[index].name.toString(),
                            style: const TextStyle(color: Colors.black),
                          ),
                          Text(
                            controller.products[index].description.toString(),
                            style: const TextStyle(color: Colors.black),
                          ),
                          const SizedBox(height: 10, width: 10),
                          Text(
                            controller.products[index].value.toString(),
                            style: const TextStyle(color: Colors.black),
                          ),
                          const SizedBox(height: 10, width: 10),
                          Text(
                            controller.products[index].id.toString(),
                            style: const TextStyle(color: Colors.black),
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            );
          }),
    );
  }
}
