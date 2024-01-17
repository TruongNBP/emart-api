import 'package:emart_food_delivery_app/utils/colors.dart';
import 'package:flutter/material.dart';

class RecommendedFoodDetail extends StatelessWidget {
  const RecommendedFoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(0),
              child: Container(
                color: Colors.white,
                child: Center(child: Text("Sliver App Bar")),
                width: double.maxFinite,
                padding: EdgeInsets.only(top: 5, bottom: 10),
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
            child: Text(
              "Phở NBPT is a famous dish in Viet Nam. It is a combination of many ingredients such as beef, chicken, pork, fish, shrimp, crab, squid, etc. It is a combination of many ingredients such as beef, chicken, pork, fish, shrimp, crab, squid, etc. It is a combination of many ingredients such as beef, chicken, pork, fish, shrimp, crab, squid, etc. It is a combination of many ingredients such as beef, chicken, pork, fish, shrimp, crab, squid, etc. It is a combination of many ingredients such as beef, chicken, pork, fish, shrimp, crab, squid, etc. It is a combination of many ingredients such as beef, chicken, pork, fish, shrimp, crab, squid, etc. It is a combination of many ingredients such as beef, chicken, pork, fish, shrimp, crab, squid, etc. Phở NBPT is a famous dish in Viet Nam. It is a combination of many ingredients such as beef, chicken, pork, fish, shrimp, crab, squid, etc. It is a combination of many ingredients such as beef, chicken, pork, fish, shrimp, crab, squid, etc. It is a combination of many ingredients such as beef, chicken, pork, fish, shrimp, crab, squid, etc. It is a combination of many ingredients such as beef, chicken, pork, fish, shrimp, crab, squid, etc. It is a combination of many ingredients such as beef, chicken, pork, fish, shrimp, crab, squid, etc. It is a combination of many ingredients such as beef, chicken, pork, fish, shrimp, crab, squid, etc. It is a combination of many ingredients such as beef, chicken, pork, fish, shrimp, crab, squid, etc. Phở NBPT is a famous dish in Viet Nam. It is a combination of many ingredients such as beef, chicken, pork, fish, shrimp, crab, squid, etc. It is a combination of many ingredients such as beef, chicken, pork, fish, shrimp, crab, squid, etc. It is a combination of many ingredients such as beef, chicken, pork, fish, shrimp, crab, squid, etc. It is a combination of many ingredients such as beef, chicken, pork, fish, shrimp, crab, squid, etc. It is a combination of many ingredients such as beef, chicken, pork, fish, shrimp, crab, squid, etc. It is a combination of many ingredients such as beef, chicken, pork, fish, shrimp, crab, squid, etc. It is a combination of many ingredients such as beef, chicken, pork, fish, shrimp, crab, squid, etc.Phở NBPT is a famous dish in Viet Nam. It is a combination of many ingredients such as beef, chicken, pork, fish, shrimp, crab, squid, etc. It is a combination of many ingredients such as beef, chicken, pork, fish, shrimp, crab, squid, etc. It is a combination of many ingredients such as beef, chicken, pork, fish, shrimp, crab, squid, etc. It is a combination of many ingredients such as beef, chicken, pork, fish, shrimp, crab, squid, etc. It is a combination of many ingredients such as beef, chicken, pork, fish, shrimp, crab, squid, etc. It is a combination of many ingredients such as beef, chicken, pork, fish, shrimp, crab, squid, etc. It is a combination of many ingredients such as beef, chicken, pork, fish, shrimp, crab, squid, etc."
              ),

          ),
        ],
      ),
    );
  }
}