import 'package:flutter/material.dart';
import 'package:news_app/app_style/app_color.dart';

class NewsDetails extends StatelessWidget {
  var data;
  NewsDetails({required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.button_color,
        centerTitle: true,
        title: Text(
          "All News Details",
          style: AppStyle.text_styl,
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.share,
              color: Colors.white,
              size: 28,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Card(
            elevation: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 180,
                  width: double.maxFinite,
                  child: Image.network(
                    data['image'],
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data['title'],
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Text(
                            data['Date_time'],
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.green,
                                fontWeight: FontWeight.bold),
                          ),
                          VerticalDivider(
                            color: Colors.black,
                            thickness: 2,
                          ),
                          Text(
                            data['location'],
                            style: TextStyle(
                                fontSize: 18,
                                color: AppColor.button_color,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        data['description'],
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          height: 1.5,
                        ),
                      )
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}
