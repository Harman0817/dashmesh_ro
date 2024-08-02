import 'package:get/get.dart';

class AddCustomerController extends GetxController {


  final _isLoading = false.obs;
  set isLoading(value) => this._isLoading.value = value;
  get isLoading => this._isLoading.value;

  Future<void> addCustomer() async {
    isLoading = true;
    try {
      isLoading = false;
      Get.back();
    } catch (e) {
      isLoading = false;
      Get.snackbar('Error', e.toString());
    }
  }
}
