import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sdm_mini_project/config/style.dart';

class EditMenu extends StatefulWidget {
  final String menuName;
  final int price;
  final int catergory;
  EditMenu({Key key, this.menuName, this.price, this.catergory})
      : super(key: key);

  @override
  _EditMenuState createState() => _EditMenuState();
}

class _EditMenuState extends State<EditMenu> {
  TextEditingController menuNameController;
  TextEditingController priceController;
  int catergory = 1;
  @override
  void initState() {
    menuNameController = TextEditingController(text: widget.menuName);
    priceController = TextEditingController(text: widget.price.toString());
    setState(() {
      catergory = widget.catergory;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text('เพิ่มรายการอาหาร')),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Style.marginHorz, vertical: 20),
            child: Column(
              children: [
                TextField(
                  controller: menuNameController,
                  decoration: InputDecoration(
                    hintText: 'ชื่ออาหาร',
                  ),
                ),
                TextField(
                  controller: priceController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: 'ราคา',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [Expanded(child: Divider())],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('ประเภท', style: TextStyle(fontSize: 16))),
                ),
              ],
            ),
          ),
          ListView(
            shrinkWrap: true,
            children: [
              ListTile(
                title: const Text('อาหารจานเดียว'),
                leading: Radio(
                  value: 1,
                  groupValue: catergory,
                  onChanged: (value) {
                    if (catergory != value) {
                      setState(() {
                        catergory = value;
                      });
                    }
                  },
                ),
              ),
              ListTile(
                title: const Text('อาหารทะเล'),
                leading: Radio(
                  value: 2,
                  groupValue: catergory,
                  onChanged: (value) {
                    if (catergory != value) {
                      setState(() {
                        catergory = value;
                      });
                    }
                  },
                ),
              ),
              ListTile(
                title: const Text('ทานเล่น'),
                leading: Radio(
                  value: 3,
                  groupValue: catergory,
                  onChanged: (value) {
                    if (catergory != value) {
                      setState(() {
                        catergory = value;
                      });
                    }
                  },
                ),
              ),
              ListTile(
                title: const Text('อาหารอีสาน'),
                leading: Radio(
                  value: 4,
                  groupValue: catergory,
                  onChanged: (value) {
                    if (catergory != value) {
                      setState(() {
                        catergory = value;
                      });
                    }
                  },
                ),
              ),
              ListTile(
                title: const Text('ยำ'),
                leading: Radio(
                  value: 5,
                  groupValue: catergory,
                  onChanged: (value) {
                    if (catergory != value) {
                      setState(() {
                        catergory = value;
                      });
                    }
                  },
                ),
              ),
              ListTile(
                title: const Text('ซุป'),
                leading: Radio(
                  value: 6,
                  groupValue: catergory,
                  onChanged: (value) {
                    if (catergory != value) {
                      setState(() {
                        catergory = value;
                      });
                    }
                  },
                ),
              ),
              ListTile(
                title: const Text('ผัด'),
                leading: Radio(
                  value: 7,
                  groupValue: catergory,
                  onChanged: (value) {
                    if (catergory != value) {
                      setState(() {
                        catergory = value;
                      });
                    }
                  },
                ),
              ),
              ListTile(
                title: const Text('ของหวาน'),
                leading: Radio(
                  value: 8,
                  groupValue: catergory,
                  onChanged: (value) {
                    if (catergory != value) {
                      setState(() {
                        catergory = value;
                      });
                    }
                  },
                ),
              ),
              ListTile(
                title: const Text('เครื่องดื่ม'),
                leading: Radio(
                  value: 9,
                  groupValue: catergory,
                  onChanged: (value) {
                    if (catergory != value) {
                      setState(() {
                        catergory = value;
                      });
                    }
                  },
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                  child: SizedBox(
                height: 50,
                child: ElevatedButton.icon(
                    icon: FaIcon(FontAwesomeIcons.edit),
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => Container(
                          height: MediaQuery.of(context).size.height / 4,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Text('ยืนยันการแก้ไขเมนู'),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 50),
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            primary: Colors.green),
                                        child: Text('ยืนยัน'),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 50),
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            primary: Colors.red),
                                        child: Text('ยกเลิก'),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    label: Text(
                      'แก้ไขเมนู',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    )),
              )),
            ],
          )
        ],
      ),
    );
  }
}
