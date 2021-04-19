import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sdm_mini_project/actions/menu.dart';
import 'package:sdm_mini_project/config/style.dart';
import 'package:sdm_mini_project/providers/FoodProvider.dart';
import 'package:sdm_mini_project/views/login.dart';
import 'package:sdm_mini_project/views/menu/ListMenu.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


  double _currentIndex = 0;
  CarouselController _carouselController = CarouselController();

  @override
  void initState() {
    context.read<FoodProvider>().loadAllFoodMenu();
    super.initState();
  }

  GestureDetector foodCatergory({Image image, String name, Function action}) {
    return GestureDetector(
      onTap: action,
      child: Card(
        elevation: 5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 96, height: 96, child: image),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                name,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          title: Text('ร้านตาต้าท้ายเหมือง'),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Container(
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Text('เมนูแนะนำ',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700)),
                            ),
                            IconButton(
                                icon: FaIcon(
                                  FontAwesomeIcons.store,
                                  color: Colors.blue,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Login(),
                                      ));
                                })
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Expanded(child: Divider()),
              ],
            ),
            CarouselSlider(
                carouselController: _carouselController,
                items: [
                  Image.asset(
                    'assets/images/menu01.jpg',
                    width: 512,
                  ),
                  Image.asset(
                    'assets/images/menu02.jpg',
                    width: 512,
                  ),
                  Image.asset(
                    'assets/images/menu03.jpg',
                    width: 512,
                  ),
                ],
                options: CarouselOptions(
                  // height: 400,
                  //
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index.toDouble();
                    });
                  },
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.8,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 1000),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  // onPageChanged: callbackFunction,
                  scrollDirection: Axis.horizontal,
                )),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: DotsIndicator(
                dotsCount: 3,
                position: _currentIndex,
                decorator: DotsDecorator(
                  size: const Size.square(9.0),
                  activeSize: const Size(18.0, 9.0),
                  activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Card(
                          child: Padding(
                        padding: EdgeInsets.all(Style.marginHorz),
                        child: Text(
                          'รายการอาหาร',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w300),
                        ),
                      )),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                // Expanded(child: Divider()),
                Expanded(
                //     child: ElevatedButton(
                //   child: Text('Test Add'),
                //   onPressed: () {
                //     // ActionMenu().addNewMenu(
                //     //     {"category": 6, "name": "Curry", "price": 90});
                //     // ActionMenu().deleteMenu();
                //   },
                // )
                child: Divider(),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(Style.marginHorz),
              child: GridView.count(
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                shrinkWrap: true,
                children: [
                  foodCatergory(
                      image: Image.asset('assets/images/breakfast.png'),
                      name: 'อาหารจานเดียว',
                      action: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ListMenu(
                                editMode: false,
                                foods: context
                                    .watch<FoodProvider>()
                                    .foods_menu
                                    .where((result) => result['category']
                                        .toString()
                                        .contains('1'))
                                    .toList(),
                              ),
                            ));
                      }),
                  foodCatergory(
                      image: Image.asset('assets/images/dish.png'),
                      name: 'อาหารทะเล',
                      action: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ListMenu(
                                editMode: false,
                                foods: context
                                    .watch<FoodProvider>()
                                    .foods_menu
                                    .where((result) => result['category']
                                        .toString()
                                        .contains('2'))
                                    .toList(),
                              ),
                            ));
                      }),
                  foodCatergory(
                      image: Image.asset('assets/images/french-fries.png'),
                      name: 'อาหารทานเล่น',
                      action: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ListMenu(
                                editMode: false,
                                foods: context
                                    .watch<FoodProvider>()
                                    .foods_menu
                                    .where((result) => result['category']
                                        .toString()
                                        .contains('3'))
                                    .toList(),
                              ),
                            ));
                      }),
                  foodCatergory(
                      image: Image.asset('assets/images/mortar.png'),
                      name: 'อาหารอีสาน',
                      action: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ListMenu(
                                editMode: false,
                                foods: context
                                    .watch<FoodProvider>()
                                    .foods_menu
                                    .where((result) => result['category']
                                        .toString()
                                        .contains('4'))
                                    .toList(),
                              ),
                            ));
                      }),
                  foodCatergory(
                      image: Image.asset('assets/images/salad.png'),
                      name: 'ยำ',
                      action: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ListMenu(
                                editMode: false,
                                foods: context
                                    .watch<FoodProvider>()
                                    .foods_menu
                                    .where((result) => result['category']
                                        .toString()
                                        .contains('5'))
                                    .toList(),
                              ),
                            ));
                      }),
                  foodCatergory(
                      image: Image.asset('assets/images/soup.png'),
                      name: 'ซุป',
                      action: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ListMenu(
                                editMode: false,
                                foods: context
                                    .watch<FoodProvider>()
                                    .foods_menu
                                    .where((result) => result['category']
                                        .toString()
                                        .contains('6'))
                                    .toList(),
                              ),
                            ));
                      }),
                  foodCatergory(
                      image: Image.asset('assets/images/fried.png'),
                      name: 'ผัด',
                      action: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ListMenu(
                                editMode: false,
                                foods: context
                                    .watch<FoodProvider>()
                                    .foods_menu
                                    .where((result) => result['category']
                                        .toString()
                                        .contains('7'))
                                    .toList(),
                              ),
                            ));
                      }),
                  foodCatergory(
                      image: Image.asset('assets/images/cake-slice.png'),
                      name: 'ของหวาน',
                      action: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ListMenu(
                                editMode: false,
                                foods: context
                                    .watch<FoodProvider>()
                                    .foods_menu
                                    .where((result) => result['category']
                                        .toString()
                                        .contains('8'))
                                    .toList(),
                              ),
                            ));
                      }),
                  foodCatergory(
                      image: Image.asset('assets/images/lemonade.png'),
                      name: 'เครื่องดื่ม',
                      action: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ListMenu(
                                editMode: false,
                                foods: context
                                    .watch<FoodProvider>()
                                    .foods_menu
                                    .where((result) => result['category']
                                        .toString()
                                        .contains('9'))
                                    .toList(),
                              ),
                            ));
                      }),
                ],
              ),
            ),
          ]),
        )
      ],
    ));
  }
}
