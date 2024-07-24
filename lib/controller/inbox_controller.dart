import 'package:get/get.dart';

class InboxController extends GetxController {
  var isMainChatScreenVisible = true.obs;
  var selectedTabIndex = 0.obs;

  void showMainChatScreen() {
    isMainChatScreenVisible.value = true;
    selectedTabIndex.value = 0; // Ensure the "Messages" tab is selected
  }

  void showNoMessagesScreen() {
    isMainChatScreenVisible.value = false;
    selectedTabIndex.value = 0; // Ensure the "Messages" tab is selected
  }

  void selectTab(int index) {
    selectedTabIndex.value = index;
  }
}
