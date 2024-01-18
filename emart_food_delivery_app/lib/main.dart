// import 'package:emart_food_delivery_app/pages/food/popular_food_detail.dart';
import 'package:emart_food_delivery_app/controllers/popular_product_controller.dart';
import 'package:emart_food_delivery_app/controllers/recommended_product_controller.dart';
// import 'package:emart_food_delivery_app/pages/home/food_page_body.dart';
import 'package:emart_food_delivery_app/pages/home/main_food_page.dart';
import 'package:emart_food_delivery_app/routes/route_helper.dart';
// import 'package:emart_food_delivery_app/pages/food/recommended_food_detail.dart';
// import 'package:emart_food_delivery_app/pages/home/main_food_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'helper/dependencies.dart' as dep; 

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecommendedProductController>().getRecommendedProductList();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: const MainFoodPage(),
      initialRoute: RouteHelper.initial,
      getPages: RouteHelper.routes,
    );
  }
}

