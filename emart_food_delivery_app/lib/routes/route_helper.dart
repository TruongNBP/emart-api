import 'package:emart_food_delivery_app/pages/food/popular_food_detail.dart';
import 'package:emart_food_delivery_app/pages/home/main_food_page.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String initial = "/";
  static const String popularFood = "/popular-food";

  static List<GetPage> routes = [
    GetPage(name: "/", page: ()=>MainFoodPage()),
    GetPage(name: popularFood, page: (){
      print("popular food get called");
      return PopularFoodDetail();
    }),
  ];
}