import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/category_controller.dart';
import '../../models/category.dart';

class CategoryTile extends StatelessWidget {
  CategoryController controller=Get.find();
  final Category category;
  final int index;

  CategoryTile({required this.category, required this.index});

  @override
  Widget build(BuildContext context) {
    final CategoryController categoryController = Get.find();
    return ListTile(
      title: Text(category.name),
      subtitle:  Text('Total: \$${categoryController.calculateTotalCost(category)}'),
      onTap: () {
         Get.toNamed('/itemList', arguments: index);
      },
    );
  }
}
