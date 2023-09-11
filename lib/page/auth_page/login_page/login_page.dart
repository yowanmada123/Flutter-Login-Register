import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_register/page/auth_page/register_page/register_page.dart';
import 'package:login_register/utils/ext_text.dart';
import '../../../controller/auth_controller.dart';
import '../../../controller/global_controller.dart';
import '../../../utils/colors.dart';
import '../../../widget/button_base.dart';

// Tampilan Halaman Login untuk user.
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final c = Get.put(GlobalController());
  final auth = Get.put(AuthController());
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: Get.width,
            height: Get.height,
            color: Colors.white,
          ),
          Positioned(
            top: -300,
            left: -165,
            child: Container(
              width: 700,
              height: 700,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(1000),
                color: OPrimaryColor,
              ),
            ),
          ),
          SizedBox(
            child: SingleChildScrollView(
              physics: const ScrollPhysics(),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 100),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            const SizedBox(
                              height: 12,
                            ),
                            const Text(
                              "Selamat Datang !",
                            ).p20b().white(),
                            const Text(
                              "Masuk untuk lanjut",
                            ).p12r().white(),
                            const SizedBox(
                              height: 8,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 322,
                          height: 320,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.9),
                                spreadRadius: 0.3,
                                blurRadius: 5,
                                offset: const Offset(0, 0.1), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                "Masuk Akun",
                              ).p16b().black(),
                              const SizedBox(
                                height: 15,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 26),
                                child: TextField(
                                  style: const TextStyle(color: Colors.black, fontSize: 14),
                                  controller: auth.emailController,
                                  decoration: const InputDecoration(
                                    isDense: true,
                                    labelText: 'Email',
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey),
                                    ),
                                    labelStyle: TextStyle(color: Colors.grey),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 26),
                                child: TextField(
                                  style: const TextStyle(color: Colors.black, fontSize: 14),
                                  controller: auth.passwordController,
                                  obscureText: _isObscure,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    labelText: 'Password',
                                    labelStyle: const TextStyle(color: Colors.grey),
                                    enabledBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey),
                                    ),
                                    focusedBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey),
                                    ),
                                    border: InputBorder.none,
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          _isObscure = !_isObscure;
                                        });
                                      },
                                      icon: Icon(_isObscure ? Icons.visibility : Icons.visibility_off),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 26),
                                child: BaseButton(
                                  ontap: () => auth.validateLogin(context),
                                  text: "Masuk",
                                  outlineRadius: 100,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: const Text(
                                  "Lupa Password ?",
                                ).p10m().primary(),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 34.0),
                    child: Container(
                      width: 322,
                      height: 52,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.9),
                            spreadRadius: 0.3,
                            blurRadius: 5,
                            offset: const Offset(0, 0.1), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              auth.clear();
                              Get.to(
                                const RegisterPage(),
                              );
                            },
                            child: RichText(
                              text: TextSpan(
                                text: 'Belum punya akun ?  ',
                                style: GoogleFonts.poppins(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'Daftar Disini',
                                    style: GoogleFonts.poppins(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600,
                                      color: OPrimaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "© 2023 Kofie Soft. All rights reserved.",
                  ).p12r().grey(),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
