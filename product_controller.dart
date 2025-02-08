import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProductController extends GetxController {
  var products = [].obs;
  var categories = [].obs;

  @override
  void onInit() {
    fetchProducts();
    fetchCategories();
    super.onInit();
  }

  void fetchProducts() async {
    var response =
        await http.get(Uri.parse('https://fakestoreapi.com/products'));
    if (response.statusCode == 200) {
      products.value = jsonDecode(response.body);
    }
  }

  void fetchCategories() async {
    var response = await http
        .get(Uri.parse('https://fakestoreapi.com/products/categories'));
    if (response.statusCode == 200) {
      categories.value = jsonDecode(response.body);
    }
  }

  void deleteProduct(int id) {
    products.removeWhere((product) => product['id'] == id);
  }
}
