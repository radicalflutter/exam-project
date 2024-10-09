import 'package:get/get.dart';


import '../controller/category_controller.dart';
import '../controller/item_controller.dart';

class TodoListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CategoryController>(() => CategoryController());
    Get.lazyPut<ItemController>(() => ItemController());
  }
}
