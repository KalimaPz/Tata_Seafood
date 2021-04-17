import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sdm_mini_project/config/style.dart';
import 'package:sdm_mini_project/views/login.dart';
import 'package:sdm_mini_project/views/menu/ListMenu.dart';

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
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => Login(),));
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
                  Container(
                    color: Colors.blue,
                  ),
                  Container(
                    color: Colors.green,
                  ),
                  Container(
                    color: Colors.blue,
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
            // Text(_carouselController.),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Card(
                          // padding: const EdgeInsets.symmetric(vertical : 20.0),
                          // color: Colors.blue,
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
                Expanded(child: Divider()),
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
                              builder: (context) => ListMenu(),
                            ));
                      }),
                  foodCatergory(
                      image: Image.asset('assets/images/dish.png'),
                      name: 'อาหารทะเล',
                      action: () {}),
                  foodCatergory(
                      image: Image.asset('assets/images/french-fries.png'),
                      name: 'อาหารทานเล่น',
                      action: () {}),
                  foodCatergory(
                      image: Image.asset('assets/images/mortar.png'),
                      name: 'อาหารอีสาน',
                      action: () {}),
                  foodCatergory(
                      image: Image.asset('assets/images/salad.png'),
                      name: 'ยำ',
                      action: () {}),
                  foodCatergory(
                      image: Image.asset('assets/images/soup.png'),
                      name: 'ซุป',
                      action: () {}),
                  foodCatergory(
                      image: Image.asset('assets/images/fried.png'),
                      name: 'ผัด',
                      action: () {}),
                  foodCatergory(
                      image: Image.asset('assets/images/cake-slice.png'),
                      name: 'ของหวาน',
                      action: () {}),
                  foodCatergory(
                      image: Image.asset('assets/images/lemonade.png'),
                      name: 'เครื่องดื่ม',
                      action: () {}),
                ],
              ),
            ),
          ]),
        )
      ],
    ));
  }
}
