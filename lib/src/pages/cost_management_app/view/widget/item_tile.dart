import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../infrastructure/route/route_names.dart';
import '../../controller/category_controller.dart';
import '../../controller/item_controller.dart';
import '../../models/item.dart';

class ItemTile extends StatelessWidget {
  final Item item;
  final int index;
  final int categoryIndex;

  ItemTile({required this.item, required this.index, required this.categoryIndex});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('${item.name} - \$${item.price.toStringAsFixed(2)}'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              Get.toNamed(RouteNames.addEditItem, arguments: {'itemIndex': index, 'categoryIndex': categoryIndex});
            },
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              Get.find<ItemController>().removeItem(index);
              Get.find<CategoryController>().categories[categoryIndex].items = Get.find<ItemController>().items;
            },
          ),
        ],
      ),
    );
  }
}
