import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opeec/view/custom_widgets/sized_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../controller/utils/constant.dart';

class InboxNoMessagesScreen extends StatelessWidget {
  final VoidCallback onNavigate;

  const InboxNoMessagesScreen({super.key, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          getVerticalSpace(18.h),
          Center(
            child: GestureDetector(
              onTap: onNavigate,
              child: Image.asset(
                "assets/png/noMessage.png",
                width: 220.px,
                height: 195.px,
              ),
            ),
          ),
          getVerticalSpace(2.h),
          Text(
            "No Messages Yet",
            style: Constant.textNameBlack6,
          ),
        ],
      ),
    );
  }
}
