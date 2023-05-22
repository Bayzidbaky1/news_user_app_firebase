import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/app_style/app_color.dart';
import 'package:news_app/route/route.dart';

class LivePage extends StatelessWidget {
  const LivePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: (){
            Get.toNamed(live);
          },
            child: Text(
          'Click here for Live Video',
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColor.button_color),
        )),
      ),
    );
  }
}
