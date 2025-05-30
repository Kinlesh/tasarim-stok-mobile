// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tm_stok/Button_Functions/buttons_controller.dart';
import 'package:tm_stok/Models/Button.dart';
import 'package:tm_stok/Models/TypeData.dart';
import 'package:tm_stok/Models/veri.dart';

class add_button extends ButtonHelper {
  add_button(BuildContext context) : super(context);
  buttons_controller controller = Get.find();
  TypeData? selectedType;
  void add_button_clicked(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: ((context) {
        return SizedBox(
          height: double.tryParse(AutofillHints.name),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child:
                    Title(color: Colors.black, child: const Text("Ürün Ekle")),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: FutureBuilder<List<TypeData>>(
                  future: controller.typeDataController.getTypes(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<TypeData>> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    if (snapshot.hasError) {
                      return const Center(
                        child: Text('Veri çekme sırasında bir hata oluştu'),
                      );
                    }

                    final types = snapshot.data ?? [];
                    controller.componentList.value = types.cast<veri>();

                    return DropdownButton<TypeData>(
                      hint: const Text('Ürün Tipini Seçiniz'),
                      value: selectedType,
                      items: types.map((TypeData type) {
                        return DropdownMenuItem<TypeData>(
                          value: type,
                          child: Text(type.name ?? ''),
                        );
                      }).toList(),
                      onChanged: (TypeData? newValue) {
                        newValue;
                      },
                    );
                  },
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Malzeme Adını Giriniz',
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Ürün ID Giriniz',
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Stok Sayısı Giriniz',
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Ürün Konumunu Giriniz',
                  ),
                ),
              ),
              IconButton(
                  alignment: Alignment.bottomRight,
                  splashColor: Colors.green,
                  onPressed: () => {
                        showSnackBar("Eklendi"),
                      },
                  icon: const Icon(Icons.check)),
            ],
          ),
        );
      }),
    );
  }
}
