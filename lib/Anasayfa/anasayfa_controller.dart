import 'package:get/get.dart';
import 'package:tm_stok/Controllers/veri_controllers.dart';
import 'package:tm_stok/Models/veri.dart';

class AnasayfaController extends GetxController {
  final VeriController veriController = VeriController.instance;
  RxList<veri> selectedItems = <veri>[].obs;
  RxList<veri> componentList = <veri>[].obs;
  RxList<veri> filterComponentList = <veri>[].obs;
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
