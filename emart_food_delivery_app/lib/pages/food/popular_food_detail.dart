import 'package:emart_food_delivery_app/pages/home/main_food_page.dart';
import 'package:emart_food_delivery_app/utils/colors.dart';
import 'package:emart_food_delivery_app/utils/dimensions.dart';
import 'package:emart_food_delivery_app/widgets/app_column.dart';
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
  const PopularFoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: Dimensions.popularFoodImgSize,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    "assets/images/food0.png",
                  ),
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
                  onTap: (){
                    Get.to(()=>const MainFoodPage());
                  },
                  ),
                AppIcon(icon: Icons.shopping_cart_outlined),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: Dimensions.popularFoodImgSize),
            child: SingleChildScrollView(
              child: Positioned(
                left: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.only(
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                    top: Dimensions.height20,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BigText(text: "Vietnamese traditional pho", size: Dimensions.font26,),
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
                      ExpandableTextWidget(text: "Phở là một món ăn truyền thống của Việt Nam, được xem là món ăn tiêu biểu nhất của ẩm thực Việt Nam. Phở có nguồn gốc từ tỉnh Nam Định, sau đó lan rộng ra khắp cả nước và trở nên phổ biến trên thế giới.Thành phần chính của phở là bánh phở, nước dùng và thịt bò hoặc thịt gà. Nước dùng của phở được ninh từ xương bò hoặc xương gà trong nhiều giờ, tạo nên vị ngọt thanh, đậm đà. Thịt bò hoặc thịt gà được thái mỏng, chín tái hoặc chín kỹ tùy theo sở thích của mỗi người. Phở có hương vị thơm ngon, đậm đà, hấp dẫn. Đây là món ăn thích hợp cho mọi lứa tuổi, mọi hoàn cảnh. Phở có thể được ăn sáng, ăn trưa, ăn tối hoặc ăn đêm.Phở là món ăn mang đậm bản sắc văn hóa Việt Nam. Phở đã trở thành một biểu tượng của ẩm thực Việt Nam, được nhiều người trên thế giới yêu thích.")
                    ]
                  ),
              ),
              ),
            ),
          ),
          
        ],
      ),
      bottomNavigationBar: Container(
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
                  Icon(
                    Icons.remove,
                    color: AppColors.signColor,
                  ),
                  SizedBox(
                    width: Dimensions.width10 / 2,
                  ),
                  BigText(text: "0"),
                  SizedBox(
                    width: Dimensions.width10 / 2,
                  ),
                  Icon(
                    Icons.add,
                    color: AppColors.signColor,
                  ),
                ],
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
    );
  }
}
