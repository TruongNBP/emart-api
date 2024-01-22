import 'package:emart_food_delivery_app/utils/colors.dart';
import 'package:emart_food_delivery_app/utils/dimensions.dart';
import 'package:emart_food_delivery_app/widgets/app_text_field.dart';
import 'package:emart_food_delivery_app/widgets/big_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();
    var signUpImages = [
      "t.png",
      "f.png",
      "g.png"
    ];
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Column(
        children: [
          SizedBox(
            height: Dimensions.screenHeight*0.03,
          ),
          // ignore: sized_box_for_whitespace
          Container(
            height: Dimensions.screenHeight*0.25,
            child: Center(
              child: CircleAvatar(
                backgroundColor: AppColors.whiteColor,
                radius: 80,
                backgroundImage: AssetImage(
                  "assets/images/logo part 1.png",
                ),
              ),
            ),
          ),
          AppTextField(textController: emailController, hintText: "Email", icon: Icons.email),
          SizedBox(
            height: Dimensions.height20,
          ),
          AppTextField(textController: passController, hintText: "Password", icon: Icons.password_sharp),
          SizedBox(
            height: Dimensions.height20,
          ),
          AppTextField(textController: nameController, hintText: "Name", icon: Icons.person_2),
          SizedBox(
            height: Dimensions.height20,
          ),
          AppTextField(textController: phoneController, hintText: "Phone", icon: Icons.phone),
          SizedBox(height: Dimensions.height20+Dimensions.height20,),


          Container(
            width: Dimensions.screenWidth/2,
            height: Dimensions.screenHeight/13,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius30),
              color: AppColors.mainColor,
            ),
            child: Center(
              child: BigText(
                text: "Sign Up",
                size: Dimensions.font20+Dimensions.font20/2,
                color: AppColors.whiteColor,
                ),
            ),
          ),
          SizedBox(
            height: Dimensions.height10,
          ),
          RichText(text: TextSpan(
            recognizer: TapGestureRecognizer()..onTap=()=>Get.back(),
            text: "Have an account already?",
            style: TextStyle(
              color: Colors.grey[500],
              fontSize: Dimensions.font20,
            ),
          ),),
          SizedBox(height: Dimensions.screenHeight*0.05,),
          RichText(text: TextSpan(
            text: "Sign up using one of the following methods",
            style: TextStyle(
              color: Colors.grey[500],
              fontSize: Dimensions.font16,
            ),
          ),),
          Wrap(
            children: List.generate(3, (index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: Dimensions.radius30,
                backgroundImage: AssetImage(
                  "assets/images/${signUpImages[index]}"
                ),
              ),
            )),
          )
        ],
      ),
    );
  }
}