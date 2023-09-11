import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_register/utils/ext_date.dart';
import 'package:login_register/utils/ext_text.dart';
import 'package:login_register/widget/button_base.dart';
import 'package:login_register/widget/custom_dropdown.dart';

import '../../../controller/auth_controller.dart';
import '../../../controller/global_controller.dart';
import '../../../utils/colors.dart';
import '../../../widget/base_form.dart';

// Tampilan Halaman Register untuk user.
class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final c = Get.put(GlobalController());
  final auth = Get.put(AuthController());

  bool _isObscure = true;
  final List<String> genderItems = [
    'Laki - laki',
    'Perempuan',
  ];
  DateTime? dateTime;
  String convertedTime = "Date Of Birth";

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
            left: -230,
            child: Container(
              width: 844,
              height: 844,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  1000,
                ),
                color: OPrimaryColor,
              ),
            ),
          ),
          Positioned(
            left: -14,
            child: SizedBox(
              child: SingleChildScrollView(
                physics: const ScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 150,
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 34.0,
                      ),
                      child: Container(
                        width: 322,
                        height: 480,
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
                              height: 15,
                            ),
                            SizedBox(
                                width: 222,
                                height: 45,
                                child: const Text(
                                  "Isi Sesuai dengan Identitas Anda",
                                  textAlign: TextAlign.center,
                                ).p14b().black()),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 26,
                              ),
                              child: BaseForm(
                                controller: auth.emailController,
                                title: "Email",
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 26,
                              ),
                              child: BaseForm(
                                controller: auth.nomorController,
                                title: "Nomor HP",
                                hintText: "ex : 0822315326445",
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 26,
                              ),
                              child: BaseForm(
                                controller: auth.firstNameController,
                                title: "First Name",
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 26,
                              ),
                              child: BaseForm(
                                controller: auth.lastNameController,
                                title: "Last Name",
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 26,
                              ),
                              child: CustomDropDown(
                                title: "Jenis Kelamin",
                                items: genderItems,
                                // firstItem: p.jenisKelaminController.text == "male" ? "Laki - Laki" : "Perempuan",
                                // controller: p.jenisKelaminController,
                                firstItem: "Jenis Kelamin",
                                controller: auth.genderController,
                                isMust: true,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 26,
                              ),
                              child: GestureDetector(
                                onTap: () async {
                                  await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1940),
                                    lastDate: DateTime.now(),
                                    builder: (context, child) {
                                      return Theme(
                                        data: Theme.of(context).copyWith(
                                          colorScheme: ColorScheme.light(
                                            primary: OPrimaryColor, // <-- SEE HERE
                                            onPrimary: Colors.white, // <-- SEE HERE
                                            onSurface: Colors.black, // <-- SEE HERE
                                          ),
                                        ),
                                        child: child!,
                                      );
                                    },
                                  ).then(
                                    (date) => {
                                      setState(
                                        () {
                                          dateTime = date;
                                          convertedTime = dateTime!.toDateHuman();
                                          auth.tanggalController.text = dateTime!.toyyyyMMdd();
                                        },
                                      ),
                                    },
                                  );
                                },
                                child: Container(
                                  padding: const EdgeInsets.only(
                                    top: 12,
                                    right: 15,
                                  ),
                                  decoration: const BoxDecoration(
                                    // color: Colors.yellow,
                                    border: Border(
                                      bottom: BorderSide(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                  height: 43,
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            convertedTime,
                                            style: TextStyle(
                                              color: convertedTime == "Date Of Birth" ? Colors.grey : Colors.black,
                                            ),
                                          ),
                                          const Icon(
                                            Icons.date_range,
                                            size: 18,
                                            color: Colors.grey,
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 26,
                              ),
                              child: TextField(
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                ),
                                controller: auth.passwordController,
                                obscureText: _isObscure,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.zero,
                                  labelText: 'Password',
                                  labelStyle: const TextStyle(
                                    color: Colors.grey,
                                  ),
                                  enabledBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  border: InputBorder.none,
                                  suffixIcon: IconButton(
                                    padding: const EdgeInsets.only(right: 0),
                                    onPressed: () {
                                      setState(() {
                                        _isObscure = !_isObscure;
                                      });
                                    },
                                    icon: Icon(
                                      _isObscure ? Icons.visibility : Icons.visibility_off,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 26,
                              ),
                              child: BaseButton(
                                ontap: () => auth.validateRegister(context),
                                text: "Daftar",
                                outlineRadius: 100,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "© 2023 Kofie Soft. All rights reserved.",
                        ).p12r().grey(),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 50, left: 20),
                      child: GestureDetector(
                        onTap: () {
                          auth.clear();
                          Get.back();
                        },
                        child: const ClipOval(
                          child: Material(
                            color: Colors.white, // Button color
                            child: SizedBox(
                              width: 32,
                              height: 32,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 7.0),
                                    child: Icon(
                                      Icons.arrow_back_ios,
                                      size: 17,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "Daftar Akun",
                        ).p20b().white(),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
