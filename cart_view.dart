import 'package:flutter/material.dart';
import 'package:flutter_restful_api/controllers/cart_controller.dart';
import 'package:get/get.dart';

class CartView extends StatelessWidget {
  final CartController cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Obx(() {
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cartController.cartItems.length,
                itemBuilder: (context, index) {
                  var item = cartController.cartItems[index];
                  return ListTile(
                    title: Text(item['title']),
                    subtitle: Text('\$${item['price']}'),
                    trailing: IconButton(
                      icon: Icon(Icons.remove_shopping_cart),
                      onPressed: () {
                        cartController.removeFromCart(item);
                      },
                    ),
                  );
                },
              ),
            ),
            Text(
                'Total Amount: \$${cartController.totalAmount.toStringAsFixed(2)}'),
          ],
        );
      }),
    );
  }
}
