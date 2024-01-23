import 'package:emart_food_delivery_app/base/custom_loader.dart';
import 'package:emart_food_delivery_app/base/show_custom_snackbar.dart';
import 'package:emart_food_delivery_app/controllers/auth_controller.dart';
import 'package:emart_food_delivery_app/models/signup_body_model.dart';
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
    // ignore: no_leading_underscores_for_local_identifiers
    void _registration(AuthController authController){
      
      String name = nameController.text.trim();
      String phone = phoneController.text.trim();
      String password = passController.text.trim();
      String email = emailController.text.trim();

      if (name.isEmpty) {
        showCustomSnackBar("Type in your name", title: "Name");
      }else if(phone.isEmpty){
        showCustomSnackBar("Type in your phone number", title: "Phone number");
      }else if(email.isEmpty){
        showCustomSnackBar("Type in your phone email address", title: "Email address");
      }else if(!GetUtils.isEmail(email)){
        showCustomSnackBar("Type in a valid email address", title: "Valid email address");
      }else if(password.isEmpty){
        showCustomSnackBar("Type in your password", title: "password");
      }else if(password.length<6){
        showCustomSnackBar("Password must be at least 6 characters", title: "Password");
      }else{
        
        SignUpBody signUpBody = SignUpBody(name: name, phone: phone, email: email, password: password);
        authController.registration(signUpBody).then((status){
          if (status.isSuccess) {
            // ignore: avoid_print
            print("Success registration");
          }else{
            showCustomSnackBar(status.message);
          }
        });
      }
    }
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: GetBuilder<AuthController>(
        // ignore: no_leading_underscores_for_local_identifiers
        builder: (_authController){
          return !_authController.isLoading?SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
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
                  backgroundImage: const AssetImage(
                    "assets/images/logo part 1.png",
                  ),
                ),
              ),
            ),
            AppTextField(textController: emailController, hintText: "Email", icon: Icons.email),
            SizedBox(
              height: Dimensions.height20,
            ),
            AppTextField(textController: passController, hintText: "Password", icon: Icons.password_sharp, isObscure: true,),
            SizedBox(
              height: Dimensions.height20,
            ),
            AppTextField(textController: nameController, hintText: "Name", icon: Icons.person_2),
            SizedBox(
              height: Dimensions.height20,
            ),
            AppTextField(textController: phoneController, hintText: "Phone", icon: Icons.phone),
            SizedBox(height: Dimensions.height20+Dimensions.height20,),
        
        
            GestureDetector(
              onTap: () {
                _registration(_authController);
              },
              child: Container(
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
            SizedBox(height: Dimensions.height10,),
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
      ):const CustomLoader();
        }
        ),
    
    );

  }
}