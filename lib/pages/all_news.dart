import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/app_style/app_color.dart';
import 'package:news_app/pages/All_news_details.dart';
import 'package:news_app/route/route.dart';

class AllNews extends StatefulWidget {
  const AllNews({super.key});

  @override
  State<AllNews> createState() => _AllNewsState();
}

class _AllNewsState extends State<AllNews> {
  List<String> sliderImg = [];
  List data = [];

  bool value = false;
  var dotPosition = 0;
  fetchSliderImg() async {
    var _firestoreInstance = FirebaseFirestore.instance;
    QuerySnapshot _querySnapshot =
        await _firestoreInstance.collection('Slider_image').get();

    setState(() {
      for (var i = 0; i < _querySnapshot.docs.length; i++) {
        sliderImg.add(
          _querySnapshot.docs[i]['image'],
        );
      }
    });
    return _querySnapshot.docs;
  }

  fetchData() {
    FirebaseFirestore.instance
        .collection('All_news')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((element) {
        data.add({
          'title': element['title'], //element title is from databse key title
          'description': element['description'],
          'image': element['image'],
          'location': element['location'],
          'Date_time': element['Date_time']
        });
      });
      setState(() {
        value = true;
      });
    });
  }

  @override
  void initState() {
    fetchData();
    fetchSliderImg();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
     // controller: ScrollController(keepScrollOffset: true),
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: EdgeInsets.only(left: 25, right: 25, top: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AspectRatio(
                      aspectRatio: 3.5,
                      child: CarouselSlider(
                          items: sliderImg
                              .map((item) => Container(
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(item),
                                            fit: BoxFit.fitWidth)),
                                  ))
                              .toList(),
                          options: CarouselOptions(
                              height: 400,
                              aspectRatio: 16 / 9,
                              viewportFraction: 0.8,
                              initialPage: 0,
                              enableInfiniteScroll: true,
                              reverse: false,
                              autoPlay: true,
                              autoPlayInterval: Duration(seconds: 3),
                              autoPlayAnimationDuration:
                                  Duration(milliseconds: 800),
                              autoPlayCurve: Curves.fastOutSlowIn,
                              enlargeCenterPage: true,
                              enlargeFactor: 0.3,
                              scrollDirection: Axis.horizontal,
                              onPageChanged: (val, carouselPageChangeReason) {
                                setState(() {
                                  dotPosition = val;
                                });
                              })),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: DotsIndicator(
                        dotsCount:
                            sliderImg.length == 0 ? 1 : sliderImg.length,
                        position: dotPosition,
                        decorator: DotsDecorator(
                          color: Colors.black87, // Inactive color
                          activeColor: Colors.redAccent,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ];
      },
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'All News',
              style: AppStyle.Title_stl,
            ),
            SizedBox(
              height: 10,
            ),
            Visibility(
                visible: value,
                replacement: Center(
                  child: CircularProgressIndicator(
                    color: AppColor.button_color,
                  ),
                ),
                child: Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: data.length,
                      itemBuilder: (_, index) {
                        return InkWell(
                          onTap: (){
                            Get.toNamed(allDetails, arguments: data[index]);
                          },
                          child: Card(
                              elevation: 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 160,
                                    width: double.maxFinite,
                                    child: Image.network(
                                      data[index]['image'],
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10, bottom: 10),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          data[index]['title'],
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black87),
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              data[index]['Date_time'],
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color:  Colors.black54,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            VerticalDivider(color: Colors.black,
                                            thickness: 2,),
                                            Text(
                                              data[index]['location'],
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: AppColor.button_color,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              )),
                        );
                      }),
                ))
          ],
        ),
      ),
    ));
  }
}
