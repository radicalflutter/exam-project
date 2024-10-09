import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_x/src/infrastructure/route/route_names.dart';
import 'package:get_x/src/infrastructure/route/route_pages.dart';
import 'package:get_x/src/pages/cost_management_app/controller/category_controller.dart';

class MyApp extends GetView<CategoryController> {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expense Manager',
      initialRoute: RouteNames.categoryList,
      getPages: RoutePages.pages,
    );
  }
}