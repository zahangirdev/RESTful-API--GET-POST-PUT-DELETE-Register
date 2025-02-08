import 'package:get/get.dart';

class CartController extends GetxController {
  var cartItems = [].obs;

  void addToCart(product) {
    cartItems.add(product);
  }

  void removeFromCart(product) {
    cartItems.remove(product);
  }

  double get totalAmount =>
      cartItems.fold(0, (sum, item) => sum + item['price']);
}
