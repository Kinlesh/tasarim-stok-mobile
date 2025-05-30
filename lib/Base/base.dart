import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tm_stok/Anasayfa/anasayfa_controller.dart';
import 'package:tm_stok/Anasayfa/anasayfa_view.dart';
import 'package:tm_stok/Button_Functions/add_button.dart';
import 'package:tm_stok/Projeler/proje_view.dart';
import 'package:tm_stok/Sepet/sepet_view.dart';
import 'package:badges/badges.dart' as badges;

class BaseView extends StatefulWidget {
  const BaseView({super.key});

  @override
  State<BaseView> createState() => BaseViewState();
}

class BaseViewState extends State<BaseView> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    const Anasayfa(),
    const Proje(),
    const Sepet(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    AnasayfaController anasayfaController = Get.find();
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.add_photo_alternate_rounded),
        centerTitle: true,
        elevation: 0,
        foregroundColor: Colors.black87,
        title: const Text('TM-STOK'),
        backgroundColor: Colors.transparent,
        actions: [
          Obx(() => anasayfaController.selectedItems.isNotEmpty
              ? Align(
                  alignment: Alignment.center,
                  child: badges.Badge(
                    onTap: () => {
                      onTabTapped(2),
                    },
                    badgeContent: Text(
                      anasayfaController.selectedItems.length.toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                    child: const Icon(Icons.shopping_bag_outlined),
                  ),
                )
              : const SizedBox()),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => add_button(context).add_button_clicked(context),
          ),
        ],
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Ana Sayfa',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.extension),
            label: 'Projeler',
          ),
        ],
      ),
    );
  }
}
