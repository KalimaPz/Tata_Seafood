import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sdm_mini_project/actions/menu.dart';
import 'package:sdm_mini_project/config/style.dart';

class AddNewMenu extends StatefulWidget {
  AddNewMenu({Key key}) : super(key: key);

  @override
  _AddNewMenuState createState() => _AddNewMenuState();
}

class _AddNewMenuState extends State<AddNewMenu> {
  int catergory = 1;
  TextEditingController menuNameController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text('เพิ่มรายการอาหาร')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          shrinkWrap: true,
          children: [
            TextField(
              controller: menuNameController,
              decoration: InputDecoration(
                hintText: 'ชื่ออาหาร',
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 3,
                  child: TextField(
                    onSubmitted: (value) {},
                    controller: priceController,
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    decoration: InputDecoration(
                      hintText: 'ราคา',
                    ),
                  ),
                ),
                SizedBox(
                  child: ElevatedButton.icon(
                      icon: FaIcon(
                        FontAwesomeIcons.plus,
                        size: 12,
                      ),
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) => Container(
                            height: MediaQuery.of(context).size.height / 4,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Text('ยืนยันการเพิ่มเมนู'),
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
                                                      BorderRadius.circular(
                                                          10)),
                                              primary: Colors.green),
                                          child: Text('ยืนยัน'),
                                          onPressed: () {
                                            ActionMenu().addNewMenu({
                                              "name": menuNameController.text
                                                  .trim(),
                                              "category": catergory,
                                              "price": int.parse(
                                                  priceController.text.trim()),
                                            });
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
                                        child: Expanded(
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                primary: Colors.red),
                                            child: Text('ยกเลิก'),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                          ),
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
                        'เพิ่มเมนู',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      )),
                ),
              ],
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
      ),
    );
  }
}
