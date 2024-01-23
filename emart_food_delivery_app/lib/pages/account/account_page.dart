import 'package:emart_food_delivery_app/controllers/auth_controller.dart';
import 'package:emart_food_delivery_app/controllers/cart_controller.dart';
import 'package:emart_food_delivery_app/routes/route_helper.dart';
import 'package:emart_food_delivery_app/utils/colors.dart';
import 'package:emart_food_delivery_app/utils/dimensions.dart';
import 'package:emart_food_delivery_app/widgets/account_widget.dart';
import 'package:emart_food_delivery_app/widgets/app_icon.dart';
import 'package:emart_food_delivery_app/widgets/big_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: BigText(
          text: "Profile",
          size: 24,
          color: AppColors.whiteColor,
        ),
      ),
      body: Container(
        width: double.maxFinite,
        margin: EdgeInsets.only(
          top: Dimensions.height20,
        ),
        child: Column(
          children: [
            AppIcon(
              icon: Icons.person,
              backgroundColor: AppColors.mainColor,
              size: Dimensions.height15 * 10,
              iconColor: AppColors.whiteColor,
              iconSize: Dimensions.height45 + Dimensions.height30,
            ),
            SizedBox(
              height: Dimensions.height30,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    AccountWidget(
                      appIcon: AppIcon(
                        icon: Icons.person,
                        backgroundColor: AppColors.mainColor,
                        size: Dimensions.height10 * 5,
                        iconColor: AppColors.whiteColor,
                        iconSize: Dimensions.height10 * 5 / 2,
                      ),
                      bigText: BigText(text: "NBPT"),
                    ),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    AccountWidget(
                      appIcon: AppIcon(
                        icon: Icons.phone,
                        backgroundColor: AppColors.yellowColor,
                        size: Dimensions.height10 * 5,
                        iconColor: AppColors.whiteColor,
                        iconSize: Dimensions.height10 * 5 / 2,
                      ),
                      bigText: BigText(text: "0987654321"),
                    ),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    AccountWidget(
                      appIcon: AppIcon(
                        icon: Icons.email,
                        backgroundColor: AppColors.yellowColor,
                        size: Dimensions.height10 * 5,
                        iconColor: AppColors.whiteColor,
                        iconSize: Dimensions.height10 * 5 / 2,
                      ),
                      bigText: BigText(text: "abc@example.com"),
                    ),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    AccountWidget(
                      appIcon: AppIcon(
                        icon: Icons.location_on,
                        backgroundColor: AppColors.yellowColor,
                        size: Dimensions.height10 * 5,
                        iconColor: AppColors.whiteColor,
                        iconSize: Dimensions.height10 * 5 / 2,
                      ),
                      bigText: BigText(text: "Fill in your address"),
                    ),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    AccountWidget(
                      appIcon: AppIcon(
                        icon: Icons.message_outlined,
                        backgroundColor: AppColors.yellowColor,
                        size: Dimensions.height10 * 5,
                        iconColor: AppColors.whiteColor,
                        iconSize: Dimensions.height10 * 5 / 2,
                      ),
                      bigText: BigText(text: "Message"),
                    ),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    GestureDetector(
                      onTap: (){
                        if (Get.find<AuthController>().userLoggedIn()) {
                          Get.find<AuthController>().clearSharedData();
                          Get.find<CartController>().clear();
                          Get.find<CartController>().clearCartHistory();
                          Get.offNamed(RouteHelper.getInitial()); 
                        }
                      },
                      child: AccountWidget(
                      appIcon: AppIcon(
                        icon: Icons.logout,
                        backgroundColor: AppColors.iconColor2,
                        size: Dimensions.height10 * 5,
                        iconColor: AppColors.whiteColor,
                        iconSize: Dimensions.height10 * 5 / 2,
                      ),
                      bigText: BigText(text: "Log out"),
                    ),
                    )

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
