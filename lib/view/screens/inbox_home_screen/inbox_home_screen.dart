import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opeec/controller/utils/my_color.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../controller/inbox_controller.dart';
import '../../../controller/utils/constant.dart';
import '../notification_section/notification_screen.dart';
import 'inbox_no_message_screen.dart';
import 'inbox_main_chat_screen.dart';

class InboxHomeScreen extends StatelessWidget {
  const InboxHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final InboxController controller = Get.put(InboxController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 8.h), // Adjust spacing as needed
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.h),
            child: Text("Inbox", style: Constant.textSearchOrange1),
          ),
          SizedBox(height: 1.h), // Spacing between title and description
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.h),
            child: Text(
              "Remain connected seamlessly",
              style: Constant.textPerfectBlack6,
            ),
          ),
          SizedBox(height: 2.h), // Space before the TabBar
          Expanded(
            child: DefaultTabController(
              length: 2, // Number of tabs
              initialIndex: controller.selectedTabIndex.value,
              child: Column(
                children: [
                  // Tab bar
                  Container(
                    width: double.infinity,
                    color: MyColor.greyColor3,
                    child: Align(
                      alignment: Alignment.center,
                      child: TabBar(
                        onTap: (index) {
                          controller.selectTab(index);
                        },
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
                          Tab(text: "Messages"),
                          Tab(text: "Notification"),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 1.h), // Space between TabBar and TabBarView
                  Obx(() {
                    return Expanded(
                      child: TabBarView(
                        children: [
                          controller.isMainChatScreenVisible.value
                              ? const InboxMainChatScreen()
                              : InboxNoMessagesScreen(
                            onNavigate: controller.showMainChatScreen,
                          ),
                          const NotificationScreen(),
                        ],
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
