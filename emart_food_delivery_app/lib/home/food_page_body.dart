import 'package:emart_food_delivery_app/utils/colors.dart';
import 'package:emart_food_delivery_app/widgets/big_text.dart';
import 'package:emart_food_delivery_app/widgets/icon_and_text_wiget.dart';
import 'package:emart_food_delivery_app/widgets/small_text.dart';
import 'package:flutter/material.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;
  double _scaleFactor = 0.8;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
        // ignore: avoid_print, prefer_interpolation_to_compose_strings
        print("Current value is " + _currPageValue.toString());
      });
     });
  }

  @override
  void dispose(){
    pageController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.redAccent,
      height: 320,
      child: PageView.builder(
        controller: pageController,
        itemCount: 5,
        itemBuilder: (context, position) {
          return _buildPageItem(position);
        },
      ),
    );
  }

  Widget _buildPageItem(int index) {
    Matrix4 matrix = new Matrix4.identity();
    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
    }else if(index == _currPageValue.floor()+1){
      var currScale = _scaleFactor + (_currPageValue - index +1) * (1 - _scaleFactor);
    }

    return Stack(children: [
      Container(
        height: 220,
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color:
              index.isEven ? const Color(0xff69c5df) : const Color(0xff9294cc),
          image: DecorationImage(
              fit: BoxFit.cover, image: AssetImage("assets/images/food0.png")),
        ),
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 120,
          margin: EdgeInsets.only(left: 30, right: 30, bottom: 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: AppColors.whiteColor,
          ),
          child: Container(
            padding: EdgeInsets.only(top: 15, left: 15, right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BigText(text: "Pho Bo NBPT"),
                SizedBox(
                  height: 10,
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
                    SizedBox(
                      width: 10,
                    ),
                    SmallText(text: '4.5'),
                    SizedBox(
                      width: 10,
                    ),
                    SmallText(text: '1745'),
                    SizedBox(
                      width: 10,
                    ),
                    SmallText(text: 'comments')
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                )
              ],
            ),
          ),
        ),
      ),
    ]);
  }
}
