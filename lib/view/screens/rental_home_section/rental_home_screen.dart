import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:opeec/controller/utils/my_color.dart';
import 'package:opeec/view/screens/rental_home_section/rented_none_equipment_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../controller/utils/constant.dart';
import '../inbox_home_screen/inbox_no_message_screen.dart';

class RentalHomeScreen extends StatefulWidget {
  const RentalHomeScreen({super.key});

  @override
  State<RentalHomeScreen> createState() => _RentalHomeScreenState();
}

class _RentalHomeScreenState extends State<RentalHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 8.h), // Adjust spacing as needed
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 2.h),
            child: Text("Rentals", style: Constant.textSearchOrange1),
          ),
          SizedBox(height: 1.h), // Spacing between title and description
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 2.h),
            child: Text(
              "Efficiently manage and track your rented equipment",
              style: Constant.textPerfectBlack6,
            ),
          ),
          SizedBox(height: 2.h), // Space before the TabBar
          Expanded(
            child: DefaultTabController(
              length: 2, // Number of tabs
              child: Column(
                children: [
                  // Tab bar
                  Container(
                    width: double.infinity,
                    color: MyColor.greyColor3,
                    child: Align(alignment:Alignment.center ,
                      child: TabBar(
                        dividerColor: Colors.transparent,
                        padding: EdgeInsets.symmetric(horizontal: 2.5.h),
                        indicatorPadding: EdgeInsets.symmetric(horizontal: 4.h),
                        indicator: UnderlineTabIndicator(
                          borderSide: BorderSide(
                            width: 2.0,
                            color: MyColor.orangeColor1,
                          ),
                        ),
                        indicatorSize: TabBarIndicatorSize.tab,
                        labelStyle: Constant.textForgotOrange,
                        unselectedLabelColor: MyColor.greyColor1,
                        tabs: [
                          Tab(text: "Rented"),
                          Tab(text: "History"),

                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 1.h), // Space between TabBar and TabBarView
                  Expanded(
                    child: TabBarView(
                      children: [
                        // Content for Tab 1
                        RentedNoneEquipmentScreen(),
                        // Content for Tab 2
                        RentedNoneEquipmentScreen(),

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
