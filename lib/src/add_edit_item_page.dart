import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x/src/pages/cost_management_app/controller/category_controller.dart';
import 'package:get_x/src/pages/cost_management_app/controller/item_controller.dart';

class AddEditItemScreen extends StatelessWidget {
  final ItemController itemController = Get.find();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  final int? index = Get.arguments['itemIndex'];
  final int categoryIndex = Get.arguments['categoryIndex'];

  AddEditItemScreen({Key? key}) : super(key: key) {
    if (index != null) {
      final item = itemController.items[index!];
      nameController.text = item.name;
      priceController.text = item.price.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(index == null ? 'Add Item' : 'Edit Item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Item Name'),
            ),
            TextField(
              controller: priceController,
              decoration: InputDecoration(labelText: 'Price'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final name = nameController.text;
                final price = double.tryParse(priceController.text) ?? 0;

                if (index == null) {
                  itemController.addItem(name, price);
                } else {
                  itemController.updateItem(index!, name, price);
                }

                Get.find<CategoryController>().categories[categoryIndex].items = itemController.items;
                Get.back();
              },
              child: Text(index == null ? 'Add' : 'Update'),
            ),
          ],
        ),
      ),
    );
  }
}
