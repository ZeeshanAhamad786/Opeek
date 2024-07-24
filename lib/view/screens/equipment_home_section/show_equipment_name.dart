import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:opeec/controller/utils/my_color.dart';
import 'package:opeec/view/custom_widgets/sized_widget.dart';
import 'package:opeec/view/screens/equipment_home_section/equipment_add_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../controller/utils/constant.dart';
class ShowEquipmentName extends StatefulWidget {
  const ShowEquipmentName({super.key});
  @override
  State<ShowEquipmentName> createState() => _ShowEquipmentNameState();
}
class _ShowEquipmentNameState extends State<ShowEquipmentName> {

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
              style: TextStyle(color: Colors.orange), // Adjust this as needed
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
                    Get.to(()=>const EquipmentAddScreen());
                  },
                      child: Text('Edit',style: Constant.textAddBlack6,)),
                ),
                // const PopupMenuItem<int>(
                //   value: 2,
                //   child: Divider(color: MyColor.greyColor,)
                // ),
                 PopupMenuItem<int>(
                  value: 3,
                  child: GestureDetector(onTap: () {
                    showAlertDialog(context);
                  },
                      child: Text('Delete',style: Constant.textAddBlack6,)),
                ),
              ],
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
              height: 26.h,
              width: 43.2.h,
              padding: EdgeInsets.symmetric(horizontal: 4.4.h, vertical: 2.8.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3.5.h),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  getHorizontalSpace(2.h),
                  Text(
                    'Delete Equipment',
                    style: Constant.textBlack1
                  ),
                  getVerticalSpace(2.5.h),
                  Text(
                    'Are you sure you want to Delete this Post?',
                    style: Constant.textOtpBlack
                        .copyWith(color: const Color(0xff222222),
                        fontWeight: FontWeight.w600),
                  ),
                  getVerticalSpace(3.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 6.h, vertical: 1.h),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2.h),
                            border: Border.all(color: const Color(0xffA0A0A0)),
                          ),
                          child: Text(
                            'No',
                            style: Constant.textForgotOrange
                                .copyWith(color:  const Color(0xffA0A0A0)),
                          ),
                        ),
                      ),
                      getHorizontalSpace(1.h),// Replaced custom method with SizedBox for simplicity
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 6.h, vertical: 1.1.h),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: const Color(0xffF20707),
                            borderRadius: BorderRadius.circular(1.2.h),
                          ),
                          child: Text(
                            'Yes',
                            style: Constant.textAccountBlack
                                .copyWith(color: Colors.white),
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
  }
}
