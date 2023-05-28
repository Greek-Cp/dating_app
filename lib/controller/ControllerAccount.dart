import 'package:dating_app/model/ModelAkun.dart';
import 'package:get/get.dart';

class ControllerAccount extends GetxController {
  Rx<DataAkun> dataAkun = DataAkun().obs;

  void updateDataAkun(DataAkun dataAkunNew) {
    dataAkun.value = dataAkunNew;
  }

  @override
  void onClose() {
    // Clean up resources when the controller is closed
    super.onClose();
  }
}
