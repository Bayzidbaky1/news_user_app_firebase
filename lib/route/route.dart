import 'package:get/get.dart';
import 'package:news_app/pages/All_news_details.dart';
import 'package:news_app/pages/Home.dart';
import 'package:news_app/pages/onboarding.dart';
import 'package:news_app/pages/search_page.dart';

import '../pages/live_details.dart';
import '../pages/splash.dart';
import '../pages/top_news_details.dart';

const String home = '/home';
const String allDetails = '/allDetails';
const String search = '/search';
const String topDetails = '/topDetails';
const String splash = '/splash';
const String onboarding = '/onboarding';
const String live = '/live';




List<GetPage> GetPages = [
  GetPage(name: home, page: (() => HomePage())),
  GetPage(
      name: allDetails,
      page: (() => NewsDetails(
            data: Get.arguments,
          ))),
  GetPage(name: search, page: (() => SearchPage())),
  GetPage(
      name: topDetails,
      page: (() => TopNewsDetails(
            data: Get.arguments,
          ))),
  GetPage(name: splash, page: (() => SplashScreen())),
  GetPage(name: onboarding, page: (() => OnboardingScreen())),
  // GetPage(name: live, page: (() => MyWebsite())),


];
