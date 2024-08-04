import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../controller/utils/constant.dart';
import '../../../controller/utils/my_color.dart';
import '../../custom_widgets/sized_widget.dart';

class ChatSupportLive extends StatefulWidget {
  const ChatSupportLive({super.key, this.title, this.imagePath});
  final String? title;
  final String? imagePath;

  @override
  State<ChatSupportLive> createState() => _ChatSupportLiveState();
}

class _ChatSupportLiveState extends State<ChatSupportLive> {
  @override
  Widget build(BuildContext context) {
    RxList<String> chatList = <String>[].obs;
    RxInt selectedIndex = 0.obs;

    RxString messageLength = ''.obs;
    final TextEditingController chatController = TextEditingController();
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.h),
        child: Column(
          children: [
            SizedBox(height: 8.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: const Icon(Icons.arrow_back_ios_new),
                ),
                Text(
                  "Chat Support",
                  style: Constant.textProfile,
                ),
                SizedBox(height: 10.px, width: 10.px),
              ],
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.3.h),
                child: Column(
                  children: [
                    getVerticalSpace(3.8.h),
                    Text(
                      '12:10AM',style: Constant.textTime,
                    ),
                    Obx(
                          () => ListView.builder(
                        itemCount: chatList.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Stack(
                            children: [
                              Row(
                                children: [
                                  // CircleAvatar(
                                  //   radius: 2.5.h,
                                  //   backgroundImage: AssetImage(widget.imagePath!),
                                  // ),
                                  // getHorizontalSpace(1.5.h),
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 1.h),
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.all(1.h),
                                    decoration: BoxDecoration(
                                      color: MyColor.orangeColor1,
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10.px),
                                        bottomRight: Radius.circular(10.px),
                                        topRight: Radius.circular(10.px),
                                      ),
                                    ),
                                    child: Text(
                                      chatList[index],
                                      style: TextStyle(
                                        fontFamily: 'medium',
                                        color: const Color(0xffFFFFFF),
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12.px,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          );
                        },
                      ),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [

                              Expanded(
                                child: TextFormField(
                                  controller: chatController,
                                  onChanged: (value) {
                                    messageLength.value = value;
                                  },
                                  autocorrect: false,
                                  enableSuggestions: false,
                                  cursorColor: MyColor.orangeColor1,
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    fillColor: const Color(0xffF8F8F8),
                                    filled: true,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(3.h),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(3.h),
                                      borderSide: const BorderSide(color: MyColor.greyColor5),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(3.h),
                                      borderSide: const BorderSide(color:MyColor.orangeColor1),
                                    ),
                                    isCollapsed: true,
                                    contentPadding:  EdgeInsets.symmetric(horizontal: 10.px,vertical: 8.px),
                                    hintText: 'Type your message',
                                    hintStyle: TextStyle(
                                      fontSize: 12.px,
                                      fontWeight: FontWeight.w400,
                                      color: MyColor.blackColor12
                                    ),
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ),
                        getHorizontalSpace(1.h),
                        GestureDetector(
                          onTap: () {
                            if (chatController.text.isNotEmpty) {
                              chatList.add(chatController.text);
                              chatController.clear();
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 0.8.h),
                            decoration: BoxDecoration(
                              color: MyColor.orangeColor2,
                              borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(24.px),
                                right: Radius.circular(24.px),
                              ),
                            ),
                            child: SvgPicture.asset(
                              'assets/svg/shareIcon.svg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                    getVerticalSpace(2.2.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
