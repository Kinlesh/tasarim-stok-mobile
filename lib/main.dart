import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:tm_stok/Anasayfa/anasayfa_controller.dart';
import 'package:tm_stok/Base/base.dart';
import 'Button_Functions/buttons_controller.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.lazyPut(() => AnasayfaController());
  Get.lazyPut(() => buttons_controller());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: BaseView(),
  ));
}
