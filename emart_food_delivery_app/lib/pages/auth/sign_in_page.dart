import 'package:emart_food_delivery_app/base/show_custom_snackbar.dart';
import 'package:emart_food_delivery_app/controllers/auth_controller.dart';
import 'package:emart_food_delivery_app/pages/auth/sign_up_page.dart';
import 'package:emart_food_delivery_app/routes/route_helper.dart';
import 'package:emart_food_delivery_app/utils/colors.dart';
import 'package:emart_food_delivery_app/utils/dimensions.dart';
import 'package:emart_food_delivery_app/widgets/app_text_field.dart';
import 'package:emart_food_delivery_app/widgets/big_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passController = TextEditingController();
    void _login(AuthController authController){
      
      String password = passController.text.trim();
      String email = emailController.text.trim();

      if(email.isEmpty){
        showCustomSnackBar("Type in your phone email address", title: "Email address");
      }else if(!GetUtils.isEmail(email)){
        showCustomSnackBar("Type in a valid email address", title: "Valid email address");
      }else if(password.isEmpty){
        showCustomSnackBar("Type in your password", title: "password");
      }else if(password.length<6){
        showCustomSnackBar("Password must be at least 6 characters", title: "Password");
      }else{
        
        authController.login(email, password).then((status){
          if (status.isSuccess) {
            Get.toNamed(RouteHelper.getInitial());
          }else{
            // showCustomSnackBar(status.message);
            Get.toNamed(RouteHelper.getInitial());
          }
        });
      }
    }

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: GetBuilder<AuthController>(
        builder: (authController){
          return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: Dimensions.screenHeight * 0.03,
            ),
            // ignore: sized_box_for_whitespace
            Container(
              height: Dimensions.screenHeight * 0.25,
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
            Container(
              margin: EdgeInsets.only(
                left: Dimensions.width20,
              ),
              width: double.maxFinite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello",
                    style: TextStyle(
                      fontSize: Dimensions.font20 * 3 + Dimensions.font20 / 2,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Sign into your account",
                    style: TextStyle(
                      fontSize: Dimensions.font20,
                      color: Colors.grey[500],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Dimensions.height20,
            ),
            AppTextField(
                textController: emailController,
                hintText: "Email",
                icon: Icons.email),
            SizedBox(
              height: Dimensions.height20,
            ),
            AppTextField(
                textController: passController,
                hintText: "Password",
                icon: Icons.password_sharp, isObscure: true,),

            SizedBox(
              height: Dimensions.height10,
            ),
            Row(
              children: [
                Expanded(child: Container()),
                RichText(
                  text: TextSpan(
                    text: "Sign into your account",
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: Dimensions.font20,
                    ),
                  ),
                ),
                SizedBox(width: Dimensions.width20,),
              ],
            ),
            SizedBox(
              height: Dimensions.height20,
            ),

            GestureDetector(
              onTap: (){
                _login(authController);
              },
              child: Container(
                width: Dimensions.screenWidth / 2,
                height: Dimensions.screenHeight / 13,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius30),
                  color: AppColors.mainColor,
                ),
                child: Center(
                  child: BigText(
                    text: "Sign In",
                    size: Dimensions.font20 + Dimensions.font20 / 2,
                    color: AppColors.whiteColor,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: Dimensions.screenHeight * 0.05,
            ),

            RichText(
              text: TextSpan(
                  text: "Don't have an account? ",
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: Dimensions.font20,
                  ),
                  children: [
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Get.to(()=>const SignUpPage(), 
                        transition: Transition.fade
                        ),
                      text: "Create",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.mainBlackColor,
                        fontSize: Dimensions.font20,
                      ),
                    )
                  ]),
            ),
          ],
        ),
      );
        },
      ),
    );
  }
}
