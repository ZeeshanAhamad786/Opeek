import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class CustomController extends GetxController {
  var selectedContainer = Rx<int?>(null); // `null` means no container is selected

  void selectContainer(int index) {
    selectedContainer.value = index;
  }
}