import 'package:flutter/material.dart';
import 'package:flutter_restful_api/controllers/cart_controller.dart';
import 'package:flutter_restful_api/controllers/favorite_controller.dart';
import 'package:flutter_restful_api/controllers/product_controller.dart';
import 'package:flutter_restful_api/views/cart_view.dart';
import 'package:flutter_restful_api/views/favorite_view.dart';
import 'package:get/get.dart';

class ProductListView extends StatelessWidget {
  final ProductController productController = Get.find();
  final CartController cartController = Get.put(CartController());
  final FavoriteController favoriteController = Get.put(FavoriteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(FavoriteView());
              },
              icon: const Icon(Icons.favorite)),
          IconButton(
              onPressed: () {
                Get.to(CartView());
              },
              icon: const Icon(Icons.shopping_bag)),
        ],
      ),
      body: Obx(() {
        if (productController.products.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            itemCount: productController.products.length,
            itemBuilder: (context, index) {
              var product = productController.products[index];
              return ListTile(
                title: Text(product['title']),
                subtitle: Text('\$${product['price']}'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.favorite),
                      onPressed: () {
                        favoriteController.addToFavorites(product);
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.shopping_cart),
                      onPressed: () {
                        cartController.addToCart(product);
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        productController.deleteProduct(product['id']);
                      },
                    ),
                  ],
                ),
              );
            },
          );
        }
      }),
    );
  }
}
