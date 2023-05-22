import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/app_style/app_color.dart';
import 'package:news_app/pages/Live.dart';
import 'package:news_app/pages/all_news.dart';
import 'package:news_app/pages/top_news.dart';
import 'package:news_app/pages/video.dart';
import 'package:news_app/route/route.dart';
import 'package:news_app/widget/drwar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        drawer: new Drawer(
          backgroundColor: Colors.grey.shade700,
          child: new ListView(
            children: [
              Drwar.drwr
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: AppColor.button_color,
          centerTitle: true,
          title: Text(
            "Unic News",
            style: AppStyle.text_styl,
          ),
          bottom: TabBar(
              labelStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
              unselectedLabelStyle: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey),
              indicatorColor: AppColor.button_color,
              tabs: [
                Tab(
                  text: 'All News',
                ),
                Tab(
                  text: 'Top News',
                ),
                Tab(
                  text: 'Live',
                ),
                Tab(
                  text: 'Video',
                ),
              ]),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    onPressed: () {
                      Get.toNamed(search);
                    },
                    icon: Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 28,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.more_vert,
                      color: Colors.white,
                      size: 28,
                    )),
              ],
            )
          ],
        ),
        body: TabBarView(children: [
          AllNews(),
          TopNews(),
          LivePage(),
          VideoPages(),
        ]),
      ),
    );
  }
}
