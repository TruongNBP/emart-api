import 'package:emart_food_delivery_app/utils/colors.dart';
import 'package:emart_food_delivery_app/widgets/big_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showCustomSnackBar(String message,
    {bool isError = true, String title = "Error"}) {
  Get.snackbar(
    title,
    message,
    titleText: BigText(
      text: title,
      color: AppColors.whiteColor,
    ),
    messageText: Text(message, style: TextStyle(
      color: AppColors.whiteColor,
    ),
    ),
    colorText: AppColors.whiteColor,
    snackPosition: SnackPosition.TOP,
    backgroundColor: Colors.pink,
  );
}
