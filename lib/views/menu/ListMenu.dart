import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sdm_mini_project/actions/menu.dart';
import 'package:sdm_mini_project/config/style.dart';

class ListMenu extends StatefulWidget {
  final bool editMode;
  final List foods;
  const ListMenu({Key key, this.editMode = false, this.foods})
      : super(key: key);
  @override
  _ListMenuState createState() => _ListMenuState();
}

class _ListMenuState extends State<ListMenu> {
  Widget menuListItem(String menu_name, int catergory, int price,
      {Function callback}) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Style.marginHorz, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('$menu_name', style: TextStyle(fontSize: 16)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    widget.editMode == true
                        ? SizedBox(width: 100, child: Text('${catergory}'))
                        : Container(),
                    Text('$price ฿', style: TextStyle(fontSize: 16)),
                    widget.editMode == true
                        ? Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Row(
                              children: [
                                IconButton(
                                    icon: FaIcon(FontAwesomeIcons.edit),
                                    onPressed: () {}),
                                IconButton(
                                    icon: FaIcon(FontAwesomeIcons.trash),
                                    onPressed: callback),
                              ],
                            ),
                          )
                        : Container(),
                  ],
                ),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Divider(),
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.foods.isEmpty
        ? Scaffold(
            appBar: AppBar(
              title: Text('รายการอาหาร'),
            ),
            body: Center(
              child: Text('ไม่มีข้อมูล'),
            ),
          )
        : Scaffold(
            body: CustomScrollView(
              slivers: [
                SliverAppBar(
                  title: Text('รายการอาหาร'),
                ),
                SliverList(
                    delegate: SliverChildListDelegate([
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: widget.foods.length,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return menuListItem(
                          widget.foods[index]['name'],
                          widget.foods[index]['category'],
                          widget.foods[index]['price'],
                          callback: () => ActionMenu()
                              .deleteMenu(widget.foods[index]['name'])
                              );
                    },
                  ),
                ]))
              ],
            ),
          );
  }
}
