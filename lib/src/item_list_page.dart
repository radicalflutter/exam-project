import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x/src/pages/cost_management_app/controller/category_controller.dart';
import 'package:get_x/src/pages/cost_management_app/controller/item_controller.dart';
import 'package:get_x/src/pages/cost_management_app/view/widget/item_tile.dart';
import 'infrastructure/route/route_names.dart';

class ItemListScreen extends StatelessWidget {
  final CategoryController categoryController = Get.put(CategoryController());
  final ItemController itemController = Get.put(ItemController());
  final int categoryIndex = Get.arguments;

  @override
  Widget build(BuildContext context) {
    final category = categoryController.categories[categoryIndex];
    itemController.items.assignAll(category.items);

    return Scaffold(
      appBar: AppBar(
        title: Text(category.name),
      ),
      body: Obx(
            () => ListView.builder(
          itemCount: itemController.items.length,
          itemBuilder: (context, index) {
            final item = itemController.items[index];
            return ItemTile(item: item, index: index, categoryIndex: categoryIndex);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(

          onPressed: () {
    Get.toNamed(RouteNames.addEditItem, arguments: {'categoryIndex': categoryIndex});
    },
      child: Icon(Icons.add),
    ),
    );

  } }