import 'package:emart_food_delivery_app/controllers/popular_product_controller.dart';
import 'package:emart_food_delivery_app/controllers/recommended_product_controller.dart';
import 'package:emart_food_delivery_app/pages/home/food_page_body.dart';
import 'package:emart_food_delivery_app/utils/colors.dart';
import 'package:emart_food_delivery_app/utils/dimensions.dart';
import 'package:emart_food_delivery_app/widgets/big_text.dart';
import 'package:emart_food_delivery_app/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  Future<void> _loadResource() async {
    await Get.find<PopularProductController>().getPopularProductList();
    await Get.find<RecommendedProductController>().getRecommendedProductList();
  }
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _loadResource,
      child: Column(
        children: [
          // ignore: avoid_unnecessary_containers
          Container(
            child: Container(
              margin: EdgeInsets.only(
                  top: Dimensions.height45, bottom: Dimensions.height15),
              padding: EdgeInsets.symmetric(horizontal: Dimensions.width20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BigText(
                        text: "Viet Nam",
                        color: AppColors.mainColor,
                        size: 30,
                      ),
                      Row(
                        children: [
                          SmallText(
                            text: "Ho Chi Minh",
                            color: Colors.black54,
                          ),
                          const Icon(
                            Icons.arrow_drop_down,
                            color: Colors.black54,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Center(
                    child: Container(
                      width: Dimensions.height45,
                      height: Dimensions.height45,
                      // ignore: sort_child_properties_last
                      child: Icon(
                        Icons.search,
                        color: AppColors.whiteColor,
                        size: Dimensions.iconSize24,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.mainColor,
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius15),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Expanded(child: SingleChildScrollView(child: FoodPageBody())),
        ],
      ),
    );
  }
}
