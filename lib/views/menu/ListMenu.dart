import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sdm_mini_project/config/style.dart';

class ListMenu extends StatefulWidget {
  final bool editMode;
  const ListMenu({Key key, this.editMode = false}) : super(key: key);
  @override
  _ListMenuState createState() => _ListMenuState();
}

class _ListMenuState extends State<ListMenu> {
  Widget menuListItem(String menu_name, int price) {
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
                widget.editMode == true
                    ? Text('Catagory')
                    : Container(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('$price ฿', style: TextStyle(fontSize: 16)),
                    widget.editMode == true
                        ? Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: IconButton(
                                icon: FaIcon(FontAwesomeIcons.edit),
                                onPressed: () {}),
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
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text('Catergory'),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                menuListItem('sss', 30),
                menuListItem('sss', 30),
                menuListItem('sss', 30),
                menuListItem('sss', 30),
                menuListItem('sss', 30),
                menuListItem('sss', 30),
              ],
            )
          ]))
        ],
      ),
    );
  }
}
