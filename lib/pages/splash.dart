import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:news_app/app_style/app_color.dart';
import 'package:news_app/route/route.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
    final box = GetStorage();

  //Splash screen duration function
  anotherScreen() {
    var value = box.read("checked");
    print(value);

    if (value == true) {
      Get.toNamed(home);
    } else {
      Get.toNamed(onboarding);
    }
  }

  @override
  void initState() {
    Future.delayed(Duration(seconds: 5), () => anotherScreen());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.button_color,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/logos.png",
              width: 250,
            ),
            // SizedBox(
            //   height: 20,
            // ),
            Text(
              "News App",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  fontSize: 24),
            ),
          ],
        ),
      ),

    );
  }
}