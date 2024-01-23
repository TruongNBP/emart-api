// import 'package:emart_food_delivery_app/pages/food/popular_food_detail.dart';
import 'package:emart_food_delivery_app/controllers/cart_controller.dart';
import 'package:emart_food_delivery_app/controllers/popular_product_controller.dart';
import 'package:emart_food_delivery_app/controllers/recommended_product_controller.dart';
// ignore: unused_import
import 'package:emart_food_delivery_app/pages/auth/sign_in_page.dart';
// ignore: unused_import
import 'package:emart_food_delivery_app/pages/splash/splash_page.dart';
import 'package:emart_food_delivery_app/routes/route_helper.dart';

// import 'package:emart_food_delivery_app/pages/cart/cart_page.dart';


// import 'package:emart_food_delivery_app/pages/home/food_page_body.dart';

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
    Get.find<CartController>().getCartData();
    return GetBuilder<PopularProductController>(
      builder: (_){
        return GetBuilder<RecommendedProductController>(
          builder: (_){
            return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      // home: SignInPage(),
      // home: SplashScreen(),
      initialRoute: RouteHelper.getSplashPage(),
      getPages: RouteHelper.routes,
    );
          },
          );
      },
    );
  }
}

