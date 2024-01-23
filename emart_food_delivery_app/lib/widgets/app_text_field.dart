import 'package:emart_food_delivery_app/utils/colors.dart';
import 'package:emart_food_delivery_app/utils/dimensions.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController textController;
  final String hintText;
  final IconData icon;
  bool isObscure;
  AppTextField({super.key, required this.textController, required this.hintText, required this.icon, this.isObscure=false});

  @override
  Widget build(BuildContext context) {
    return Container(
            margin: EdgeInsets.only(
              left: Dimensions.height20,
              right: Dimensions.height20,
            ),
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(Dimensions.radius15),
              boxShadow: [
                BoxShadow(
                  blurRadius: 3,
                  spreadRadius: 1,
                  offset: Offset(1, 1),
                  color: Colors.grey.withOpacity(0.2)
                ),
              ]
            ),
            child: TextField(
              obscureText: isObscure?true:false,
              controller: textController,
              decoration: InputDecoration(
                hintText: hintText,
                prefixIcon: Icon(icon, color: AppColors.yellowColor,),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(Dimensions.radius15),
                  borderSide: BorderSide(
                    width: 1.0,
                    color: AppColors.whiteColor
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(Dimensions.radius15),
                  borderSide: BorderSide(
                    width: 1.0,
                    color: AppColors.whiteColor
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(Dimensions.radius15),
                ),
              ),
            ),
          );
  }
}