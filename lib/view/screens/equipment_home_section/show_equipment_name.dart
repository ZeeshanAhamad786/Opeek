import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:opeec/controller/utils/my_color.dart';
import 'package:opeec/view/custom_widgets/sized_widget.dart';
import 'package:opeec/view/screens/equipment_home_section/equipment_home_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../controller/utils/constant.dart';
import 'equipment_add_screen.dart';
class ShowEquipmentName extends StatefulWidget {
  const ShowEquipmentName({super.key});
  @override
  State<ShowEquipmentName> createState() => _ShowEquipmentNameState();
}
class _ShowEquipmentNameState extends State<ShowEquipmentName> {
  List<String> data=[
    "Very cooperative seller and equipment just like new.",
    "Very cooperative seller and equipment just like new.",
    "Very cooperative seller and equipment just like new.",
    "Very cooperative seller and equipment just like new.",
    "Very cooperative seller and equipment just like new.",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: const Icon(Icons.arrow_back_ios_new, size: 20),
            ),
            Text(
                "Equipment Name",
                style: Constant.textName // Adjust this as needed
            ),
            PopupMenuButton<int>(
              icon: const Icon(Icons.more_vert),
              onSelected: (int result) {
                // Handle the selected menu item
                print('Selected: $result');
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<int>>[

                 PopupMenuItem<int>(
                  value: 1,
                  child: GestureDetector(onTap: () {
                    Get.to(()=>const EquipmentHomeScreen(showButton: true,));
                  },
                      child: Text('Edit',style: Constant.textAddBlack6,)),
                ),
                 PopupMenuItem<int>(
                  value: 3,
                  child: GestureDetector(onTap: () {
                    showAlertDialog(context);
                  },
                      child: Text('Delete',style: Constant.textAddBlack6,)),
                ),
              ],
              color: Colors.white,

            ),
          ],
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 2.h),
        child: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset("assets/png/drillLarge.png"),
              getVerticalSpace(2.h),
              Text("Basic Info",style: Constant.textNameBlack6,),
              getVerticalSpace(1.h),
              Text("Equipment Name",style: Constant.textAddBlack6,),
              getVerticalSpace(.8.h),
              const Divider(color: MyColor.greyColor,),
              getVerticalSpace(1.3.h),
              Text("Equipment Make",style: Constant.textAddBlack6,),
              getVerticalSpace(.8.h),
              const Divider(color: MyColor.greyColor,),
              getVerticalSpace(1.3.h),
              Text("Equipment Model",style: Constant.textAddBlack6,),
              getVerticalSpace(.8.h),
              const Divider(color: MyColor.greyColor,),
              getVerticalSpace(1.3.h),
              Text("Category",style: Constant.textAddBlack6,),
              getVerticalSpace(.8.h),
              const Divider(color: MyColor.greyColor,),
              getVerticalSpace(1.3.h),
              Text("Description ",style: Constant.textAddBlack6,),
              getVerticalSpace(.8.h),
              const Divider(color: MyColor.greyColor,),
              getVerticalSpace(2.h),
              Text("Address",style: Constant.textNameBlack6,),
              getVerticalSpace(1.3.h),
              Text("Location",style: Constant.textAddBlack6,),
              getVerticalSpace(.8.h),
              const Divider(color: MyColor.greyColor,),
              getVerticalSpace(2.h),
              Text("Pickup and Delivery",style: Constant.textNameBlack6,),
              getVerticalSpace(1.3.h),
              Text(
                  'Renter Pickup/Return',
                  style: Constant.textAddBlack6
              ),

              getVerticalSpace(2.h),
              Text("Pricing",style: Constant.textNameBlack6,),
              getVerticalSpace(1.3.h),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '25',
                      style: Constant.textSignUpOrange,
                    ),
                    TextSpan(
                      text: ' \$ Per Day',
                      style: Constant.textAddBlack6,
                    ),
                  ],
                ),
              ),



              getVerticalSpace(2.h),getHorizontalSpace(2.h)
            ],),
        ),
      ),
    );
  }
  void showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: Material(
            color: Colors.transparent, // Transparent background for Material
            child: Container(
              width: 80.w, // Width responsive to screen width
              padding: EdgeInsets.symmetric(
                horizontal: 4.h, // Responsive horizontal padding
                vertical: 2.h, // Responsive vertical padding
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2.h), // Responsive border radius
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min, // Adjust the height based on content
                children: [
                  SizedBox(height: 2.h), // Responsive vertical spacing
                  Text(
                    'Delete Equipment',
                    style: Constant.textBlack1.copyWith(
                      fontSize: 18.sp, // Responsive font size
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 2.h), // Responsive vertical spacing
                  Text(
                    'Do you really want to delete the equipment?',
                    style: Constant.textRed1.copyWith(
                      fontSize: 16.sp, // Responsive font size
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 3.h), // Responsive vertical spacing
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Equal spacing
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            // Handle 'Yes' action
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 1.2.h, // Responsive vertical padding
                            ),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: const Color(0xffF20707),
                              borderRadius: BorderRadius.circular(2.h),
                            ),
                            child: Text(
                              'Yes',
                              style: Constant.textAccountBlack.copyWith(
                                color: Colors.white,
                                fontSize: 16.sp, // Responsive font size
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 2.h), // Responsive horizontal spacing
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Get.back(); // Dismiss the dialog
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 1.2.h, // Responsive vertical padding
                            ),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: const Color(0xff34C759),
                              borderRadius: BorderRadius.circular(2.h),
                              border: Border.all(color: const Color(0xff34C759)),
                            ),
                            child: Text(
                              'No',
                              style: Constant.textForgotOrange.copyWith(
                                color: Colors.white,
                                fontSize: 16.sp, // Responsive font size
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }}
