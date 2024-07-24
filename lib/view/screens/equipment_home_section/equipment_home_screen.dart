import 'package:flutter/material.dart';
import 'package:opeec/controller/utils/my_color.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../controller/utils/constant.dart';
import '../../custom_widgets/sized_widget.dart';
import 'equipment_active_screen.dart';

class EquipmentHomeScreen extends StatefulWidget {
  const EquipmentHomeScreen({super.key});

  @override
  State<EquipmentHomeScreen> createState() => _EquipmentHomeScreenState();
}

class _EquipmentHomeScreenState extends State<EquipmentHomeScreen> {
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
            child: Text("Equipment", style: Constant.textSearchOrange1),
          ),
          SizedBox(height: 1.h), // Spacing between title and description
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 2.h),
            child: Text(
              "Effortlessly organize your Equipment",
              style: Constant.textPerfectBlack6,
            ),
          ),
          SizedBox(height: 2.h), // Space before the TabBar
          Expanded(
            child: DefaultTabController(
              length: 3, // Number of tabs
              child: Column(
                children: [
                  // Tab bar
                  Container(color: MyColor.greyColor3,
                    child: TabBar(dividerColor: Colors.transparent,
                      padding: EdgeInsets.symmetric(horizontal: 2.h),
                      indicatorPadding: EdgeInsets.symmetric(horizontal: 2.h),
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
                        Tab(text: "Active"),
                        Tab(text: "Booked"),
                        Tab(text: "History"),
                      ],
                    ),
                  ),
                  SizedBox(height: 1.h), // Space between TabBar and TabBarView
                  Expanded(
                    child: TabBarView(
                      children: [
                        // Content for Tab 1
                        EquipmentActiveScreen(),
                        // Content for Tab 2
                        EquipmentActiveScreen(),
                        // Content for Tab 3
                        EquipmentActiveScreen()
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
