import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerController extends GetxController {
  RxList<String> imagePaths = <String>[].obs; // Using RxList for multiple image paths

  Future<void> getImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      if (imagePaths.length < 3) {
        imagePaths.add(image.path);
      }
    }
  }

  void removeImage(String path) {
    imagePaths.remove(path);
  }
}


//


class ImagePickerProfileController extends GetxController{
  RxString imagePath="".obs;
  Future getImage()async{
    final ImagePicker picker=ImagePicker();
    final XFile? image=await picker.pickImage(source: ImageSource.gallery);
    if(image !=null){
      imagePath.value=image.path.toString();
    }
  }
}