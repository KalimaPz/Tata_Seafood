import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sdm_mini_project/providers/FoodProvider.dart';
import 'package:sdm_mini_project/views/menu/AddNewMenu.dart';
import 'package:sdm_mini_project/views/menu/ListMenu.dart';
import 'package:provider/provider.dart';
class Backend extends StatelessWidget {
  const Backend({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Backend'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: FaIcon(FontAwesomeIcons.signOutAlt),
          )
        ],
      ),
      body: SafeArea(
          child: GridView.count(
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
                label: Text('Add')),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ListMenu(foods: context.watch<FoodProvider>().foods_menu,
                          editMode: true,
                        ),
                      ));
                },
                icon: FaIcon(FontAwesomeIcons.edit),
                label: Text('View/Edit')),
          ),
        ],
      )),
    );
  }
}
