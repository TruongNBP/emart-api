import 'package:emart_food_delivery_app/controllers/cart_controller.dart';
import 'package:emart_food_delivery_app/controllers/popular_product_controller.dart';
// import 'package:emart_food_delivery_app/pages/cart/cart_page.dart';
import 'package:emart_food_delivery_app/pages/home/main_food_page.dart';
import 'package:emart_food_delivery_app/routes/route_helper.dart';
import 'package:emart_food_delivery_app/utils/app_constants.dart';
import 'package:emart_food_delivery_app/utils/colors.dart';
import 'package:emart_food_delivery_app/utils/dimensions.dart';
// import 'package:emart_food_delivery_app/widgets/app_column.dart';
import 'package:emart_food_delivery_app/widgets/app_icon.dart';
import 'package:emart_food_delivery_app/widgets/big_text.dart';
import 'package:emart_food_delivery_app/widgets/exandable_text_widget.dart';
// ignore: unused_import
import 'package:emart_food_delivery_app/widgets/icon_and_text_wiget.dart';
// ignore: unused_import
import 'package:emart_food_delivery_app/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PopularFoodDetail extends StatelessWidget {
  final int pageId;
  final String page;
  const PopularFoodDetail({super.key, required this.pageId, required this.page});

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<PopularProductController>().popularProductList[pageId];
    
    Get.find<PopularProductController>().initProduct(product, Get.find<CartController>());

    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.maxFinite,
            height: Dimensions.popularFoodImgSize,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  AppConstants.BASE_URL +
                      AppConstants.UPLOAD_URL +
                      product.img!,
                ),
              ),
            ),
          ),
          Positioned(
            top: Dimensions.height45,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  child: AppIcon(icon: Icons.arrow_back_ios),
                  onTap: () {
                    if (page=="cartpage") {
                      Get.toNamed(RouteHelper.getCartPage());
                    } else {
                      Get.toNamed(RouteHelper.getInitial());
                    }
                  },
                ),
                GetBuilder<PopularProductController>(builder: (controller) {
                  return GestureDetector(
                    onTap: () {
                      if (controller.totalItems >= 0 )
                      // ignore: curly_braces_in_flow_control_structures
                      Get.toNamed(RouteHelper.getCartPage());
                    },
                    child: Stack(
                      children: [
                        AppIcon(icon: Icons.shopping_cart_outlined,),
                        controller.totalItems >= 1 ? 
                        Positioned(
                          right: 0,
                          top: 0,
                            child: AppIcon(icon: Icons.circle, size: 20, iconColor: Colors.transparent,
                            backgroundColor: AppColors.mainColor,),
                          
                        ) : 
                        Container(),
                        Get.find<PopularProductController>().totalItems >= 1 ? 
                        Positioned(
                          right: 3,
                          top: 3,
                          child: BigText(text: Get.find<PopularProductController>().totalItems.toString(),
                          size: 12,
                          color: AppColors.whiteColor,
                          ),
                        ) : 
                        Container()
                      ],
                    ),
                  );
                },
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: Dimensions.popularFoodImgSize),
            padding: EdgeInsets.only(
              left: Dimensions.width20,
              right: Dimensions.width20,
              top: Dimensions.height20,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius20),
              color: Colors.white,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(
                    text: product.name!,
                    size: Dimensions.font26,
                  ),
                  SizedBox(
                    height: Dimensions.height10,
                  ),
                  Row(
                    children: [
                      Wrap(
                        children: List.generate(5, (index) {
                          return Icon(
                            Icons.star,
                            color: AppColors.mainColor,
                            size: 15,
                          );
                        }),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SmallText(text: '4.5'),
                      const SizedBox(
                        width: 10,
                      ),
                      SmallText(text: '1745'),
                      const SizedBox(
                        width: 10,
                      ),
                      SmallText(text: 'comments')
                    ],
                  ),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconAndTextWidget(
                        icon: Icons.circle_sharp,
                        text: "Normal",
                        iconColor: AppColors.iconColor1,
                      ),
                      IconAndTextWidget(
                        icon: Icons.location_on,
                        text: "1.7km",
                        iconColor: AppColors.mainColor,
                      ),
                      IconAndTextWidget(
                        icon: Icons.access_time_rounded,
                        text: "32 min",
                        iconColor: AppColors.iconColor2,
                      ),
                    ],
                  ),
                  BigText(
                    text: "Introduce",
                    size: Dimensions.font20,
                  ),
                  SizedBox(
                    height: Dimensions.height10,
                  ),
                  ExpandableTextWidget(
                    text: product.description,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: GetBuilder<PopularProductController>(
        builder: (popularProduct){
          return Container(
        height: Dimensions.bottomHeightBar,
        padding: EdgeInsets.only(
          top: Dimensions.height30,
          bottom: Dimensions.height30,
          left: Dimensions.width20,
          right: Dimensions.width20,
        ),
        decoration: BoxDecoration(
          color: AppColors.buttonBackgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimensions.radius20 * 2),
            topRight: Radius.circular(Dimensions.radius20 * 2),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(
                top: Dimensions.height15,
                bottom: Dimensions.height15,
                left: Dimensions.width20,
                right: Dimensions.width20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      popularProduct.setQuantity(false);
                    },
                    child: Icon(
                      Icons.remove,
                      color: AppColors.signColor,
                    ),
                  ),
                  SizedBox(width: Dimensions.width10 / 2),
                  BigText(text: popularProduct.inCartItems.toString()),
                  SizedBox(width: Dimensions.width10 / 2),
                  GestureDetector(
                    onTap: () {
                      popularProduct.setQuantity(true);
                    },
                    child: Icon(
                      Icons.add,
                      color: AppColors.signColor,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                popularProduct.addItem(product);
              },
              child: Container(
                padding: EdgeInsets.only(
                  top: Dimensions.height15,
                  bottom: Dimensions.height15,
                  left: Dimensions.width20,
                  right: Dimensions.width20,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: AppColors.mainColor,
                ),
                
                  child: BigText(
                    text: "\$${product.price!} | Add to cart",
                    color: Colors.white,
                  ),
                ),
            ),
          ],
        ),
      );
    
        },),
    
    );
  }
}
