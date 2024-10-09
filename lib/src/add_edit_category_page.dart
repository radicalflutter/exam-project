import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x/src/pages/cost_management_app/controller/category_controller.dart';


class AddEditCategoryScreen extends StatelessWidget {
  final CategoryController categoryController = Get.find();
  final TextEditingController nameController = TextEditingController();

  final int? index = Get.arguments;

  AddEditCategoryScreen({Key? key}) : super(key: key) {
    if (index != null) {
      final category = categoryController.categories[index!];
      nameController.text = category.name;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(index == null ? 'Add Category' : 'Edit Category'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Category Name'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final name = nameController.text;

                if (index == null) {
                  categoryController.addCategory(name);
                } else {
                  categoryController.categories[index!].name = name;
                  categoryController.categories.refresh();
                }
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