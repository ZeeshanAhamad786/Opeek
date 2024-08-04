import 'package:get/get.dart';

class StepperController extends GetxController {
  var currentStep = 1.obs;
  var isLastStep = false.obs;
  var isSubmitted = false.obs; // Add this line

  @override
  void onInit() {
    super.onInit();
    ever(currentStep, (value) {
      isLastStep.value = value == 6;
    });
  }

  void nextStep() {
    if (currentStep.value < 6) {
      currentStep.value++;
    }
  }

  void previousStep() {
    if (currentStep.value > 1) {
      currentStep.value--;
    }
  }

  void submit() {
    if (isLastStep.value) {
      isSubmitted.value = true;
    }
  }

  void reset() {
    isSubmitted.value = false;
    currentStep.value = 1;
  }
}
