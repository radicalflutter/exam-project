import 'package:get/get.dart';

import '../models/category.dart';

class CategoryController extends GetxController {
  var categories = <Category>[].obs;

  void addCategory(String name) {
    categories.add(Category(name: name, items: []));
  }

  void removeCategory(int index) {
    categories.removeAt(index);
  }

  double calculateTotalCost(Category category) {
    return category.items.fold(0, (sum, item) => sum + item.price);
  }
}
