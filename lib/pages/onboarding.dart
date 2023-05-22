import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intro_screen_onboarding_flutter/introduction.dart';
import 'package:intro_screen_onboarding_flutter/introscreenonboarding.dart';
import 'package:news_app/app_style/app_color.dart';
import 'package:news_app/route/route.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});
    final box = GetStorage(); // initial get storage
  List<Introduction> list = [
    Introduction(
      titleTextStyle: TextStyle(fontSize: 26,color: Colors.white),
      subTitleTextStyle: TextStyle(fontSize: 20,color: Colors.white),
      title: 'Welcome',
      subTitle: 'Welcome to our News application',
      imageUrl: 'assets/slider1.png',
    ),
    Introduction(
      titleTextStyle: TextStyle(fontSize: 26,color: Colors.white),
      subTitleTextStyle: TextStyle(fontSize: 20,color: Colors.white),
      title: 'Processing',
      subTitle: 'By the “processing” of news',
      imageUrl: 'assets/slider2.png',
    ),
    Introduction(
      titleTextStyle: TextStyle(fontSize: 26,color: Colors.white),
      subTitleTextStyle: TextStyle(fontSize: 20,color: Colors.white),
      title: 'News Reading',
      subTitle: 'News Decoder offers student workshops teaching journalistic and media literacy skills',
      imageUrl: 'assets/logos.png',
    ),
    Introduction(
      titleTextStyle: TextStyle(fontSize: 26,color: Colors.white),
      subTitleTextStyle: TextStyle(fontSize: 20,color: Colors.white),
      title: 'Finish',
      subTitle: 'A news application is a big interactive database that tells a news story.',
      imageUrl: 'assets/slider4.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.button_color,
      body: IntroScreenOnboarding(
        skipTextStyle: TextStyle(color: Colors.white,fontSize: 22),
        backgroudColor: AppColor.button_color,
        introductionList: list,
        onTapSkipButton: () {
          box.write("checked", true);
          Get.toNamed(home); //MaterialPageRoute
        },
      ),
    );
  }
}