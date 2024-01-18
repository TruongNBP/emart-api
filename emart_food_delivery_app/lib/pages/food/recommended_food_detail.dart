import 'package:emart_food_delivery_app/utils/colors.dart';
import 'package:emart_food_delivery_app/utils/dimensions.dart';
import 'package:emart_food_delivery_app/widgets/app_icon.dart';
import 'package:emart_food_delivery_app/widgets/big_text.dart';
import 'package:emart_food_delivery_app/widgets/exandable_text_widget.dart';
import 'package:flutter/material.dart';

class RecommendedFoodDetail extends StatelessWidget {
  const RecommendedFoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 77,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.clear),
                AppIcon(icon: Icons.shopping_cart_outlined),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(20),
              child: Container(
                width: double.maxFinite,
                padding: const EdgeInsets.only(top: 5, bottom: 10),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                ),
                child: Center(
                  child: BigText(
                    text: "Phở NBPT",
                    size: Dimensions.font26,
                  ),
                ),
              ),
            ),
            pinned: true,
            backgroundColor: AppColors.yellowColor,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/images/food0.png",
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  // ignore: sort_child_properties_last
                  child: const ExpandableTextWidget(
                    text:
                        "Phở NBPT is a famous dish in Viet Nam. It is a combination of many ingredients such as beef, chicken, pork, fish, shrimp, crab, squid, etc. It is a combination of many ingredients such as beef, chicken, pork, fish, shrimp, crab, squid, etc. It is a combination of many ingredients such as beef, chicken, pork, fish, shrimp, crab, squid, etc. It is a combination of many ingredients such as beef, chicken, pork, fish, shrimp, crab, squid, etc. It is a combination of many ingredients such as beef, chicken, pork, fish, shrimp, crab, squid, etc. It is a combination of many ingredients such as beef, chicken, pork, fish, shrimp, crab, squid, etc. It is a combination of many ingredients such as beef, chicken, pork, fish, shrimp, crab, squid, etc. Phở NBPT is a famous dish in Viet Nam. It is a combination of many ingredients such as beef, chicken, pork, fish, shrimp, crab, squid, etc. It is a combination of many ingredients such as beef, chicken, pork, fish, shrimp, crab, squid, etc. It is a combination of many ingredients such as beef, chicken, pork, fish, shrimp, crab, squid, etc. It is a combination of many ingredients such as beef, chicken, pork, fish, shrimp, crab, squid, etc. It is a combination of many ingredients such as beef, chicken, pork, fish, shrimp, crab, squid, etc. It is a combination of many ingredients such as beef, chicken, pork, fish, shrimp, crab, squid, etc. It is a combination of many ingredients such as beef, chicken, pork, fish, shrimp, crab, squid, etc.",
                  ),
                  margin: EdgeInsets.only(
                      left: Dimensions.width20, right: Dimensions.width20),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(
              left: Dimensions.width20 * 2.5,
              right: Dimensions.width20 * 2.5,
              top: Dimensions.height10,
              bottom: Dimensions.height10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  iconSize: Dimensions.iconSize24,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                  icon: Icons.remove,
                ),
                BigText(
                  text: "\$12.88" + " x " + "0",
                  color: AppColors.mainBlackColor,
                  size: Dimensions.font26,
                ),
                AppIcon(
                  iconSize: Dimensions.iconSize24,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                  icon: Icons.add,
                ),
              ],
            ),
          ),
          Container(
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
                  child: Icon(
                    Icons.favorite,
                    color: AppColors.mainColor,
                  ),
                ),
                Container(
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
                    text: "\$10 | Add to cart",
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          
        ],
      ),
    );
  }
}
