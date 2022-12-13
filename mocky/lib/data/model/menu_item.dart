// To parse this JSON data, do
//
//     final menuResponse = menuResponseFromJson(jsonString);

import 'dart:convert';

List<MenuResponse> menuResponseFromJson(String str) => List<MenuResponse>.from(json.decode(str).map((x) => MenuResponse.fromJson(x)));

String menuResponseToJson(List<MenuResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MenuResponse {
  MenuResponse({
    required this.restaurantId,
    required this.restaurantName,
    required this.tableMenuList,
  });

  String restaurantId;
  String restaurantName;
  List<TableMenuList> tableMenuList;

  factory MenuResponse.fromJson(Map<String, dynamic> json) => MenuResponse(
    restaurantId: json["restaurant_id"],
    restaurantName: json["restaurant_name"],
    tableMenuList: List<TableMenuList>.from(json["table_menu_list"].map((x) => TableMenuList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "restaurant_id": restaurantId,
    "restaurant_name": restaurantName,
    "table_menu_list": List<dynamic>.from(tableMenuList.map((x) => x.toJson())),
  };
}

class TableMenuList {
  TableMenuList({
    required this.menuCategory,
    required this.menuCategoryId,
    required this.categoryDishes,
  });

  String menuCategory;
  String menuCategoryId;
  List<CategoryDish> categoryDishes;

  factory TableMenuList.fromJson(Map<String, dynamic> json) => TableMenuList(
    menuCategory: json["menu_category"],
    menuCategoryId: json["menu_category_id"],
    categoryDishes: List<CategoryDish>.from(json["category_dishes"].map((x) => CategoryDish.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "menu_category": menuCategory,
    "menu_category_id": menuCategoryId,
    "category_dishes": List<dynamic>.from(categoryDishes.map((x) => x.toJson())),
  };
}

class CategoryDish {
  CategoryDish({
    required this.dishId,
    required this.dishName,
    required this.dishPrice,
    required this.dishImage,
  });

  String dishId;
  String dishName;
  double dishPrice;
  String dishImage;

  factory CategoryDish.fromJson(Map<String, dynamic> json) => CategoryDish(
    dishId: json["dish_id"],
    dishName: json["dish_name"],
    dishPrice: json["dish_price"]??0.00.toDouble(),
    dishImage: json["dish_image"],
  );

  Map<String, dynamic> toJson() => {
    "dish_id": dishId,
    "dish_name": dishName,
    "dish_price": dishPrice,
    "dish_image": dishImage,
  };
}
