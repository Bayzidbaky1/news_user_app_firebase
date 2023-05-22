import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../app_style/app_color.dart';
import '../route/route.dart';

class TopNews extends StatefulWidget {
  const TopNews({super.key});

  @override
  State<TopNews> createState() => _TopNewsState();
}

class _TopNewsState extends State<TopNews> {

  List data =[];
  bool value = false;
   fetchData() {
    FirebaseFirestore.instance
        .collection('Resent_news')
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                              Get.toNamed(topDetails, arguments: data[index]);
                            },
                            child: Card(
                                elevation: 0,
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

    );
  }
}