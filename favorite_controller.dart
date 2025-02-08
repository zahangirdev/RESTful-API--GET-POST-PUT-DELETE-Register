import 'package:get/get.dart';

class FavoriteController extends GetxController {
  var favoriteItems = [].obs;

  void addToFavorites(product) {
    favoriteItems.add(product);
  }

  void removeFromFavorites(product) {
    favoriteItems.remove(product);
  }
}
