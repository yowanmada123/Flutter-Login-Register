import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_register/page/auth_page/login_page/login_page.dart';
import 'package:login_register/page/home_page/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utils/colors.dart';

// Splashscreen yang berisi halaman animasi
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () async {
      Get.offAll(
        const BlankScreen(),
        transition: Transition.circularReveal,
        duration: const Duration(seconds: 2),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          width: 206,
          height: 178,
          "assets/images/logo.jpg",
        ),
      ),
    );
  }
}

class BlankScreen extends StatefulWidget {
  const BlankScreen({super.key});

  @override
  State<BlankScreen> createState() => _BlankScreenState();
}

class _BlankScreenState extends State<BlankScreen> {
  int time = 1;

  Future<bool> getAuth() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.containsKey('login');
  }

  startAuth() async {
    await getAuth().then(
      (logedIn) {
        Future.delayed(
          Duration(seconds: time),
          () async {
            if (logedIn) {
              Get.off(
                const HomePage(),
              );
            } else {
              Get.to(const LoginPage());
            }
          },
        );
      },
    );
  }

  @override
  void initState() {
    startAuth();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: OPrimaryColor,
    );
  }
}
