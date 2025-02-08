import 'package:flutter/material.dart';
import 'package:flutter_restful_api/controllers/favorite_controller.dart';
import 'package:get/get.dart';

class FavoriteView extends StatelessWidget {
  final FavoriteController favoriteController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: Obx(() {
        return ListView.builder(
          itemCount: favoriteController.favoriteItems.length,
          itemBuilder: (context, index) {
            var item = favoriteController.favoriteItems[index];
            return ListTile(
              title: Text(item['title']),
              subtitle: Text('\$${item['price']}'),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  favoriteController.removeFromFavorites(item);
                },
              ),
            );
          },
        );
      }),
    );
  }
}
