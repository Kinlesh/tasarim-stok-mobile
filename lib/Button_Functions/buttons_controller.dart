// ignore_for_file: camel_case_types

import 'package:get/get.dart';
import '../Controllers/TypeData_controllers.dart';
import '../Controllers/veri_controllers.dart';
import '../Models/veri.dart';

class buttons_controller extends GetxController {
  final VeriController veriController = VeriController.instance;
  final TypeDataController typeDataController = TypeDataController.instance;
  RxList<veri> selectedItems = <veri>[].obs;
  RxList<veri> componentList = <veri>[].obs;
  RxList<veri> filterComponentList = <veri>[].obs;
  Rxn<veri> chosenItem = Rxn();
  

  RxnString filterText = RxnString();

  void filterList(String fText) {
    fText.isEmpty ? filterText.value = null : filterText.value = fText;
    filterComponentList.value = componentList
        .where((element) =>
            element.name!.toLowerCase().contains(fText.toLowerCase()))
        .toList()
      ..sort((a, b) => a.name!.compareTo(b.name!));
  }
}
