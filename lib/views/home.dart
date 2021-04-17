import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:sdm_mini_project/config/style.dart';

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

  GestureDetector foodCatergory({ Image image ,String name, Function action}) {
    return GestureDetector(
      child: Card(
        elevation: 5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 96,
              height: 96,
              child: image),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(name,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: false,
      //   title: Text('Main'),
      // ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: Style.marginHorz),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Text('เมนูแนะนำ',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w700)),
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
                  child: Text('รายการอาหาร'),
                ),
              ),
              Row(
                children: [
                  Expanded(child: Divider()),
                ],
              ),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  children: [
                    foodCatergory(image: Image.asset('assets/images/breakfast.png'),name: 'อาหารจานเดียว', action: () {}),
                    foodCatergory(image: Image.asset('assets/images/dish.png'),name: 'อาหารทะเล', action: () {}),
                    foodCatergory(image: Image.asset('assets/images/french-fries.png'),name: 'อาหารทานเล่น', action: () {}),
                    foodCatergory(image: Image.asset('assets/images/mortar.png'),name : 'อาหารอีสาน', action: () {}),
                    foodCatergory(image: Image.asset('assets/images/salad.png'),name: 'ยำ', action: () {}),
                    foodCatergory(image: Image.asset('assets/images/soup.png'),name: 'ซุป', action: () {}),
                    foodCatergory(image: Image.asset('assets/images/fried.png'),name: 'ผัด', action: () {}),
                    foodCatergory(image: Image.asset('assets/images/cake-slice.png'),name: 'ของหวาน', action: () {}),
                    foodCatergory(image: Image.asset('assets/images/lemonade.png'),name: 'เครื่องดื่ม', action: () {}),
                  ],
                ),
                // ListView(
                //   shrinkWrap: true,
                //   children: [
                //     foodCatergory(name: 'อาหารจานเดียว', action: () {}),
                //     foodCatergory(name: 'อาหารทะเล', action: () {}),
                //     foodCatergory(name: 'อาหารทานเล่น', action: () {}),
                //     foodCatergory(name: 'อาหารอีสาน', action: () {}),
                //     foodCatergory(name: 'ยำ', action: () {}),
                //     foodCatergory(name: 'ซุป', action: () {}),
                //     foodCatergory(name: 'ผัด', action: () {}),
                //     foodCatergory(name: 'ของหวาน', action: () {}),
                //     foodCatergory(name: 'เครื่องดื่ม', action: () {}),
                //   ],
                // ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
