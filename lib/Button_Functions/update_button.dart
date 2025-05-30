import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tm_stok/Models/Button.dart';
import '../Models/veri.dart';
import 'buttons_controller.dart';

class UpdateButton extends ButtonHelper {
  UpdateButton(BuildContext context) : super(context);
  buttons_controller controller =
      Get.put<buttons_controller>(buttons_controller());
  void updateButtonClicked(BuildContext context, veri chosenItem) {
    controller.chosenItem.value = chosenItem;
    showModalBottomSheet(
      context: context,
      builder: ((context) {
        return Obx(
          () => SizedBox(
            height: double.tryParse(AutofillHints.name),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child:
                      Title(color: Colors.black, child: const Text("Düzenle")),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextField(
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: controller.chosenItem.value?.type.toString() ??
                          'Konum Giriniz',
                      hintStyle: const TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextField(
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: controller.chosenItem.value?.count.toString() ??
                          'Stok Sayısı Giriniz',
                      hintStyle: const TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextField(
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: controller.chosenItem.value?.id.toString() ??
                          'Ürün Adını Giriniz',
                      hintStyle: const TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextField(
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText:
                          controller.chosenItem.value?.location.toString() ??
                              'Konum',
                      hintStyle: const TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                IconButton(
                    alignment: Alignment.bottomRight,
                    splashColor: Colors.green,
                    onPressed: () => {
                          Navigator.pop(context),
                        },
                    icon: const Icon(Icons.check)),
              ],
            ),
          ),
        );
      }),
    );
  }
}
