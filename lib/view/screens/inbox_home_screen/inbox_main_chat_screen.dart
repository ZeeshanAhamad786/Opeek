import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:opeec/controller/utils/my_color.dart';
import 'package:opeec/view/custom_widgets/sized_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../controller/utils/constant.dart';
import '../../../model/inbox_main_chat_screen_model.dart';

class InboxMainChatScreen extends StatelessWidget {
  const InboxMainChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final RxList<InboxMainChatScreenModel> items = [
      InboxMainChatScreenModel(
        title: "Mohsin Shop",
        subtitle: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do ut labore et dolore magna aliqua.",
        imageUrl: "assets/png/profileIcon.png",
        time: '15m ago',
      ),
      InboxMainChatScreenModel(
        title: "Mohsin Shop",
        subtitle: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do ut labore et dolore magna aliqua.",
        imageUrl: "assets/png/vectorProfile1.png",
        time: '1h ago',
      ),
      InboxMainChatScreenModel(
        title: "Mohsin Shop",
        subtitle: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do ut labore et dolore magna aliqua.",
        imageUrl: "assets/png/vectorProfile2.png",
        time: '15m ago',
      ),
      InboxMainChatScreenModel(
        title: "Mohsin Shop",
        subtitle: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do ut labore et dolore magna aliqua.",
        imageUrl: "assets/png/vectorProfile3.png",
        time: '1h ago',
      ),
      InboxMainChatScreenModel(
        title: "Mohsin Shop",
        subtitle: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do ut labore et dolore magna aliqua.",
        imageUrl: "assets/png/vectorProfile2.png",
        time: '15m ago',
      ),
    ].obs;

    return Column(
      children: [
        getVerticalSpace(2.h),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: items.length,
            shrinkWrap: true,

            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      // Get.to(() => ChatScreen());
                    },
                    child: ListTile(
                      title: Text(
                        items[index].title,
                        style: Constant.textWithBlack,
                      ),
                      subtitle: Text(
                        items[index].subtitle,
                        style: Constant.textNameBlack2,
                      ),
                      leading: CircleAvatar(
                        maxRadius: 30,
                        backgroundImage: AssetImage(items[index].imageUrl),
                      ),
                      trailing: Text(
                        items[index].time,
                        style: Constant.textNameBlack1,
                      ),
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 2.h),
                    child: Divider(color: MyColor.greyColor,),
                  )
                ],
              );
            },
          ),
        ),

      ],
    );
  }
}
