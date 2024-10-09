import 'package:get/get.dart';

import '../models/item.dart';

class ItemController extends GetxController {
  var items = <Item>[].obs;

  void addItem(String name, double price) {
    items.add(Item(name: name, price: price));
  }

  void removeItem(int index ) {
    items.removeAt(index);
  }

  void updateItem(int index, String name, double price) {
    items[index] = Item(name: name, price: price);
  }
}
