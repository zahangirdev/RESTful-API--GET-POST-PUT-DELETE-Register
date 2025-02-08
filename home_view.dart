import 'package:flutter/material.dart';
import 'package:flutter_restful_api/controllers/product_controller.dart';
import 'package:flutter_restful_api/views/product_list_view.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ecommerce App'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Get.to(ProductListView());
            },
            child: Text('View Products'),
          ),
        ],
      ),
    );
  }
}
