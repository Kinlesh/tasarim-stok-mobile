import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:tm_stok/Models/veri.dart';

class Sepet extends StatefulWidget {
  const Sepet({Key? key}) : super(key: key);

  @override
  State<Sepet> createState() => _SepetState();
}

class _SepetState extends State<Sepet> {
  @override
  Widget build(BuildContext context) {
    List<veri> addedItems = [];
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Sepet'),
        ),
        body: ListView.separated(
          shrinkWrap: true,
          itemCount: addedItems.length,
          itemBuilder: (context, index) {
            final item = addedItems[
                index]; 
            return Slidable(
              endActionPane:
                  ActionPane(motion: const BehindMotion(), children: [
                SlidableAction(
                  autoClose: true,
                  onPressed: (BuildContext context) {
                    addedItems.remove(item);
                  },
                  backgroundColor: const Color.fromARGB(255, 255, 0, 0),
                  foregroundColor: Colors.white,
                  icon: Icons.delete,
                  label: 'Sil',
                ),
              ]),
              child: ListTile(
                title: Text(item.name
                    .toString()), 
              ),
            );
          },
          separatorBuilder: (context, index) => const Divider(height: 1),
        ),
      ),
    );
  }
}
