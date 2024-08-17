import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:opeec/controller/utils/my_color.dart';
import 'package:opeec/view/custom_widgets/sized_widget.dart';
import 'package:opeec/view/screens/chat_support_section/equipment_live_chat.dart';
import 'package:opeec/view/screens/rating_review_section/rating_review_screen.dart';
import 'package:opeec/view/screens/rental_home_section/add_rental_checkout_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../controller/utils/constant.dart';
import 'all_equipment_store_screen.dart';
class ShowEquipmentNameProfile extends StatefulWidget {
  const ShowEquipmentNameProfile({super.key});
  @override
  State<ShowEquipmentNameProfile> createState() => _ShowEquipmentNameProfileState();
}
class _ShowEquipmentNameProfileState extends State<ShowEquipmentNameProfile> {
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
           SizedBox(height: 10.px,width: 10.px,)
            // PopupMenuButton<int>(
            //   icon: const Icon(Icons.more_vert),
            //   onSelected: (int result) {
            //     // Handle the selected menu item
            //     print('Selected: $result');
            //   },
            //   itemBuilder: (BuildContext context) => <PopupMenuEntry<int>>[
            //
            //      PopupMenuItem<int>(
            //       value: 1,
            //       child: GestureDetector(onTap: () {
            //         Get.to(()=>const EquipmentAddScreen());
            //       },
            //           child: Text('Edit',style: Constant.textAddBlack6,)),
            //     ),
            //      PopupMenuItem<int>(
            //       value: 3,
            //       child: GestureDetector(onTap: () {
            //         showAlertDialog(context);
            //       },
            //           child: Text('Delete',style: Constant.textAddBlack6,)),
            //     ),
            //   ],
            //   color: Colors.white,
            //
            // ),
          ],
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 2.h),
        child: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset("assets/png/drillLarge.png"),
              getVerticalSpace(1.5.h),
              Row(mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(onTap:(){
                    Get.to(()=>const AllEquipmentStoreScreen());

                  },
                    child: CircleAvatar(
                      backgroundImage: AssetImage("assets/png/profileImage.png"),
                      radius: 24,
                    ),
                  ),
                  getHorizontalSpace(2.w),
                  GestureDetector(onTap: () {
                    Get.to(()=>const AllEquipmentStoreScreen());

                  },
                      child: Text("Mohsin Shop",style: Constant.textAccountBlack1,)),
                Spacer(),
                GestureDetector(onTap: () {
                  Get.to(()=>const EquipmentLiveChatScreen());

                },
                    child: SvgPicture.asset("assets/svg/message.svg")),
                  getHorizontalSpace(2.w),
                  GestureDetector(onTap: () {
                    Get.to(()=>const EquipmentLiveChatScreen());

                  },
                      child: Text("Message Owner",style: Constant.textForgotOrange,)),
                ],
              ),

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
              getVerticalSpace(2.h),
              Text(
                "Ratings & Reviews",
                style: Constant.textProfile,
              ),
              getVerticalSpace(1.3.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("5.0", style: Constant.text5),
                  SizedBox(width: 0.5.h),
                  RatingBar(
                    filledIcon: Icons.star,
                    filledColor: MyColor.orangeColor1,
                    size: 18,
                    emptyIcon: Icons.star_border,
                    onRatingChanged: (value) => debugPrint('$value'),
                    initialRating: 5,
                    maxRating: 5,
                  ),
                ],
              ),
              getVerticalSpace(1.h),
              const Divider(color: MyColor.greyColor,),
              getVerticalSpace(1.2.h),
              Column(
                children: [
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                      itemCount: data.length,
                      shrinkWrap: true,
                      itemBuilder: (context,index){
                        return   Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                RatingBar(
                                  filledIcon: Icons.star,
                                  filledColor: MyColor.orangeColor1,
                                  size: 12,
                                  emptyIcon: Icons.star_border,
                                  onRatingChanged: (value) => debugPrint('$value'),
                                  initialRating: 5,
                                  maxRating: 5,
                                ),
                                SizedBox(width: 0.5.h),
                                Text("Mohsin", style: Constant.textName1),
                              ],
                            ),
                            getVerticalSpace(1.h),
                            Text(data[index],style: Constant.textWithBlack,),
                            getVerticalSpace(1.3.h),
                            const Divider(color: MyColor.greyColor,)
                          ],
                        );
                  
                      }),
                  getVerticalSpace(2.h),
                  GestureDetector(onTap:(){
                    Get.to(()=>const RatingReviewScreen());
                  } ,
                    child: Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("View All(24)",style: Constant.textForgotOrange,),
                        getHorizontalSpace(1.w),
                        Icon(Icons.arrow_forward_ios_outlined,color: MyColor.orangeColor1,size: 16,)
                      ],
                    ),
                  ),
                  getVerticalSpace(3.h),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(()=>const AddRentalCheckOutScreen());

                      },
                      child: Text(
                        'Rent Now',
                        style: Constant.textCancel,
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: MyColor.orangeColor1,
                        padding: EdgeInsets.symmetric(
                          vertical: 2.h,
                          horizontal: 15.w,
                        ),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: MyColor.orangeColor1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),

                ],
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  getHorizontalSpace(2.h),
                  Text(
                    'Delete Equipment',
                    style: Constant.textBlack1
                  ),
                  getVerticalSpace(2.5.h),
                  Text(
                    'Do you really want to Delete Equipment',
                    style: Constant.textRed1),
                  getVerticalSpace(3.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 6.h, vertical: 1.1.h),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: const Color(0xffF20707),
                            borderRadius: BorderRadius.circular(2.h),
                          ),
                          child: Text(
                            'Yes',
                            style: Constant.textAccountBlack
                                .copyWith(color: Colors.white),
                          ),
                        ),
                      ),

                      getHorizontalSpace(1.h),// Replaced custom method with SizedBox for simplicity
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 6.h, vertical: 1.h),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color:  const Color(0xff34C759),
                            borderRadius: BorderRadius.circular(2.h),
                            border: Border.all(color: const Color(0xff34C759)),
                          ),
                          child: Text(
                            'No',
                            style: Constant.textForgotOrange
                                .copyWith( color: Colors.white),
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
