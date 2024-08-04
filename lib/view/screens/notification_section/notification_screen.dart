import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:opeec/controller/utils/my_color.dart';
import 'package:opeec/view/screens/rental_home_section/new_rental_request_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../controller/utils/constant.dart';
import '../../../model/notification_screen_model.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<NotificationScreenModel> data = [
    NotificationScreenModel(
      day: 'Today',
      name: 'Equipment',
      time: '4:00am',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, ',
    ),
    NotificationScreenModel(
      day: 'Yesterday',
      name: 'New Order',
      time: '4:00am',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, ',
    ),
    NotificationScreenModel(
      day: '30/06/24',
      name: 'New Message',
      time: '4:00am',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, ',
    ),
    NotificationScreenModel(
      day: '30/06/24',
      name: 'New Message',
      time: '4:00am',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, ',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(onTap: () {
        Get.to(()=>const NewRentalRequestScreen());
      },
        child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:  EdgeInsets.symmetric(vertical:1.h, horizontal: 2.h),
                  child: Row(
                    children: [
                      Text(
                        data[index].day,
                        style: Constant.textForgotOrange
                      ),
                      // Use Divider with adjusted properties
                      Expanded(
                        child: Container(
                          height: 1,
                          color: MyColor.greyColor1.withOpacity(.5), // Ensure this color contrasts with the background
                          margin:  EdgeInsets.symmetric(horizontal: 1.h), // Add margin if needed
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              data[index].name,
                              style: Constant.textOpiBlack
                            ),
                          ),
                          Flexible(
                            child: Text(
                              data[index].time,
                            style: Constant.textForgotOrange,
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 4.0),
                      Text(
                        data[index].description,
                        style:Constant.textNameBlack2
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
