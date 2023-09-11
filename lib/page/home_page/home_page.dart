import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_register/controller/auth_controller.dart';
import 'package:login_register/utils/colors.dart';
import 'package:login_register/utils/ext_text.dart';
import 'package:login_register/widget/button_base.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = Get.put(AuthController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome To Kofiesoft").p18b(),
        backgroundColor: OPrimaryColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Welcome & Enjoy my UI",
          ).p15m(),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: Get.width * 0.9,
                height: 35,
                child: BaseButton(
                  text: "Logout",
                  textSize: 15,
                  color: OSecondaryColor,
                  outlineRadius: 20,
                  ontap: () => auth.logout(context),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
