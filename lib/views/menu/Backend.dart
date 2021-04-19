import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sdm_mini_project/actions/auth.dart';
import 'package:sdm_mini_project/providers/FoodProvider.dart';
import 'package:sdm_mini_project/views/menu/AddNewMenu.dart';
import 'package:sdm_mini_project/views/menu/ListMenu.dart';
import 'package:provider/provider.dart';

import '../home.dart';

class Backend extends StatelessWidget {
  const Backend({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('จัดการเมนู'),
        actions: [
          IconButton(
            onPressed: () {
              Auth().signOut(context);
            },
            icon: FaIcon(FontAwesomeIcons.signOutAlt),
          )
        ],
      ),
      body: SafeArea(
          child: Column(
        children: [
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddNewMenu(),
                          ));
                    },
                    icon: FaIcon(FontAwesomeIcons.plusCircle),
                    label: Text('เพิ่ม')),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ElevatedButton.icon(
                    onPressed: () {
                      context.read<FoodProvider>().loadAllFoodMenu();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ListMenu(
                              foods: context.watch<FoodProvider>().foods_menu,
                              editMode: true,
                            ),
                          ));
                    },
                    icon: FaIcon(FontAwesomeIcons.edit),
                    label: Text('แก้ไข')),
              ),
            ],
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Home(),
                    ),
                    (route) => false);
              },
              child: Text('กลับหน้าหลัก'))
        ],
      )),
    );
  }
}
