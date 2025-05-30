import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:tm_stok/Anasayfa/anasayfa_controller.dart';
import 'package:tm_stok/Models/veri.dart';

import '../Button_Functions/update_button.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({Key? key}) : super(key: key);

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  AnasayfaController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: FutureBuilder<List<veri>>(
          future: controller.veriController.getVeriler(),
          builder: (BuildContext context, AsyncSnapshot<List<veri>> snapshot) {
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

            final veriler = snapshot.data ?? [];
            controller.componentList.value = veriler;
            return const ListBody();
          },
        ),
      ),
    );
  }
}

class ListBody extends StatefulWidget {
  const ListBody({Key? key}) : super(key: key);

  @override
  State<ListBody> createState() => _ListBodyState();
}

class _ListBodyState extends State<ListBody> {
  List<veri> addedItems = [];
  @override
  Widget build(BuildContext context) {
    AnasayfaController controller = Get.find<AnasayfaController>();

    return Obx(() => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                decoration: const InputDecoration(
                  hintText: 'Ara',
                  prefixIcon: Icon(Icons.search),
                ),
                onChanged: controller.filterList,
              ),
              Expanded(
                child: ListView.separated(
                  itemCount: controller.filterText.value == null
                      ? controller.componentList.length
                      : controller.filterComponentList.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    final veri = controller.filterText.value == null
                        ? controller.componentList[index]
                        : controller.filterComponentList[index];
                    return Slidable(
                      key: const ValueKey(0),
                      groupTag: const Text("data"),
                      endActionPane: ActionPane(
                        motion: const BehindMotion(),
                        children: [
                          SlidableAction(
                            onPressed: (context) async {
                              await controller.veriController
                                  .deleteVeri(context, veri.id!);
                              
                            },
                            backgroundColor:
                                const Color.fromARGB(255, 255, 0, 0),
                            foregroundColor: Colors.white,
                            icon: Icons.delete,
                            label: 'Sil',
                          ),
                          SlidableAction(
                            onPressed: (BuildContext context) {
                              UpdateButton(context)
                                  .updateButtonClicked(context, veri);
                            },
                            backgroundColor: const Color(0xFF0392CF),
                            foregroundColor: Colors.white,
                            icon: Icons.edit,
                            label: 'Düzenle',
                          ),
                        ],
                      ),
                      child: ListTile(
                        tileColor: controller.selectedItems.contains(veri)
                            ? Colors.blue
                            : null,
                        onTap: () {
                          if (controller.selectedItems.contains(veri)) {
                            controller.selectedItems.remove(veri);
                          } else if (controller.selectedItems.isNotEmpty) {
                            controller.selectedItems.add(veri);
                          }
                        },
                        onLongPress: () {
                          if (!controller.selectedItems.contains(veri)) {
                            controller.selectedItems.add(veri);
                          }
                        },
                        subtitle: Text(veri.name ?? ''),
                        title: Text(veri.type.toString()),
                        dense: true,
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 10),
                        trailing: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text("Konum->${veri.location}"),
                            Text("Stok->${veri.count}"),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const Divider(height: .1),
                ),
              ),
              if (controller.selectedItems.isNotEmpty)
                SizedBox(
                  height: 50,
                  width: 100,
                  child: Align(
                    heightFactor: double.minPositive,
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          addedItems.addAll(controller.selectedItems);
                          controller.selectedItems.clear();
              
                        });
                      },
                      child: const Text("Seçilenleri Ekle"),
                    ),
                  ),
                ),
            ],
          ),
        ));
  }
}
