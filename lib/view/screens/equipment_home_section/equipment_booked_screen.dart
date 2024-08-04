import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:opeec/view/screens/equipment_home_section/equipment_history_details.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../controller/utils/constant.dart';
import '../../../controller/utils/my_color.dart';
import '../../../model/booked_collection_model.dart';
import '../../../model/booked_delivery_model.dart';

class EquipmentBookedScreen extends StatefulWidget {
  const EquipmentBookedScreen({super.key});

  @override
  State<EquipmentBookedScreen> createState() => _EquipmentBookedScreenState();
}

class _EquipmentBookedScreenState extends State<EquipmentBookedScreen> {
  List<BookedDeliveryModel> data = [
    BookedDeliveryModel(booked: 'Delivery Pending', name: 'Rotary Tool', construction: 'Construction',
        status: 'Delivery Pending', imageUrl: 'assets/png/deliveryGlavz.png'),
    BookedDeliveryModel(booked: 'Collection', name: 'Rotary Tool', construction: 'Construction',
        status: 'Customer will return', imageUrl: 'assets/png/deliveryGlavz.png'),

  ];
  List<BookedCollectionModel> data1 = [
    BookedCollectionModel(booked: 'Delivery Pending', name: 'Rotary Tool', construction: 'Construction',
        status: 'Delivery Pending', imageUrl: 'assets/png/deliveryGlavz.png', quantity: '2', time: 'Day left'),
    BookedCollectionModel(booked: 'Collection', name: 'Rotary Tool', construction: 'Construction',
        status: 'Collect the equipment ', imageUrl: 'assets/png/deliveryGlavz.png', quantity: '', time: ''),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Delivery Pending",
                  style: Constant.textForgotOrange,
                ),
                Expanded(
                  child: Container(
                    height: 1,
                    color: MyColor.greyColor1.withOpacity(.5),
                    margin: EdgeInsets.symmetric(horizontal: 1.h),
                  ),
                ),
              ],
            ),
            SizedBox(height: 2.h),
            Flexible(
              child: GestureDetector(
                 onTap: () {
                   Get.to(()=>const EquipmentHistoryDetails());
                 },
                child: ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 1.h),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: MyColor.greyColor1.withOpacity(0.1)),
                          borderRadius: BorderRadius.circular(8.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white.withOpacity(0.1),
                              spreadRadius: 0,
                              blurRadius: 8,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              data[index].imageUrl,
                              height: 10.h,
                              width: 10.h,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(width: 2.h),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    data[index].construction,
                                    style: Constant.textBlackColor5,
                                  ),
                                  Text(
                                    data[index].name,
                                    style: Constant.textBlackColor,
                                  ),
                                  Text(
                                    data[index].status,
                                    style: Constant.textRed1,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 2.h),
            Row(
              children: [
                Text(
                  "Collection",
                  style: Constant.textForgotOrange,
                ),
                Expanded(
                  child: Container(
                    height: 1,
                    color: MyColor.greyColor1.withOpacity(.5),
                    margin: EdgeInsets.symmetric(horizontal: 1.h),
                  ),
                ),
              ],
            ),
            Flexible(
              child: GestureDetector(onTap: () {
                Get.to(()=>const EquipmentHistoryDetails());
              },
                child: ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemCount: data1.length,
                  itemBuilder: (context, index) {
                    BookedCollectionModel item = data1[index];
                    Color statusColor = (item.quantity.isNotEmpty || item.time.isNotEmpty) ? MyColor.orangeColor1 : MyColor.redColor3;

                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 1.h),
                      child: Container(
                        padding: EdgeInsets.only(right: 1.h),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: MyColor.greyColor1.withOpacity(0.1)),
                          borderRadius: BorderRadius.circular(8.0),
                          boxShadow: [
                            BoxShadow(
                              color:  Colors.white.withOpacity(0.1),
                              spreadRadius: 0,
                              blurRadius: 8,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              item.imageUrl,
                              height: 10.h,
                              width: 10.h,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(width: 2.h),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    item.construction,
                                    style: Constant.textBlackColor5,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        item.name,
                                        style: Constant.textBlackColor,
                                      ),
                                      Text(
                                        item.quantity,
                                        style: Constant.textForgotOrange,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          item.status,
                                          style: Constant.textRed1.copyWith(color: statusColor),
                                        ),
                                      ),
                                      Text(
                                        item.time,
                                        style: Constant.textForgotOrange,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
