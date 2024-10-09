import 'package:get/get.dart';
import 'package:get_x/src/infrastructure/route/route_names.dart';
import '../../add_edit_category_page.dart';
import '../../add_edit_item_page.dart';
import '../../category_list_page.dart';
import '../../item_list_page.dart';
import '../../pages/cost_management_app/commons/binding.dart';

class RoutePages {
  static final pages = [
    GetPage(
      name: RouteNames.categoryList,
      page: () => CategoryListScreen(),
      binding: TodoListBinding(),
    ),
    GetPage(
      name: RouteNames.itemList,
      page: () => ItemListScreen(),
    ),
    GetPage(
      name: RouteNames.addEditCategory,
      page: () => AddEditCategoryScreen(),
    ),
    GetPage(
      name: RouteNames.addEditItem,
      page: () => AddEditItemScreen(),
    ),
  ];
}