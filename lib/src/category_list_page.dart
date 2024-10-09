import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x/src/pages/cost_management_app/controller/category_controller.dart';
import 'package:get_x/src/pages/cost_management_app/view/widget/category_tile.dart';

import 'infrastructure/route/route_names.dart';

class CategoryListScreen extends GetView<CategoryController> {
  final CategoryController categoryController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
      ),
      body: Obx(
            () => ListView.builder(
          itemCount: categoryController.categories.length,
          itemBuilder: (context, index) {
            final category = categoryController.categories[index];
            return CategoryTile(category: category, index: index);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(RouteNames.addEditCategory);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
