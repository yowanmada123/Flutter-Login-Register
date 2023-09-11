import 'dart:convert';
import 'package:dio/dio.dart' as d;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_register/controller/global_controller.dart';
import 'package:login_register/page/auth_page/login_page/login_page.dart';
import 'package:login_register/page/home_page/home_page.dart';
import 'package:login_register/widget/showdialog_two_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  var c = Get.put(GlobalController());
  final d.Dio dio = d.Dio();

  final emailController = TextEditingController(text: '');
  final nomorController = TextEditingController(text: '');
  final firstNameController = TextEditingController(text: '');
  final lastNameController = TextEditingController(text: '');
  final genderController = TextEditingController(text: '');
  final tanggalController = TextEditingController(text: '');
  final passwordController = TextEditingController(text: "");

  clear() {
    emailController.text = "";
    nomorController.text = "";
    firstNameController.text = "";
    lastNameController.text = "";
    genderController.text = "";
    tanggalController.text = "";
    passwordController.text = "";
  }

  login(BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    dio.options.headers['content-Type'] = 'application/x-www-form-urlencoded';
    var params = {
      "username": emailController.text,
      "password": passwordController.text,
    };
    final response = await dio.post(
      'http://202.157.184.201:8000/login',
      options: d.Options(
        contentType: d.Headers.formUrlEncodedContentType,
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        },
      ),
      data: params,
    );
    if (response.statusCode == 200) {
      await prefs.setString("login", response.data['access_token']);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Login Success',
          ),
          backgroundColor: Colors.black87,
        ),
      );
      clear();
      Get.offAll(
        const HomePage(),
      );
    } else if (response.statusCode == 400 || response.statusCode == 404) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            response.data["status"]["keterangan"],
          ),
          backgroundColor: Colors.black87,
        ),
      );
    } else if (response.statusCode == 422) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            response.data["detail"],
          ),
          backgroundColor: Colors.black87,
        ),
      );
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Cek Koneksi Internet Anda",
          ),
          backgroundColor: Colors.black87,
        ),
      );
    }
  }

  logout(BuildContext context) {
    dialogBuilder(
        context: context,
        buttonLeft: () async {
          final SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.remove('login');
          prefs.clear();
          Get.offAll(
            const LoginPage(),
          );
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Logout Success'),
            backgroundColor: Colors.black87,
          ));
        },
        buttonRight: () {
          Get.back();
        },
        title: "Anda Yakin ingin Logout ?",
        leftTittle: 'Ya',
        rightTitle: "Tidak",
        barier: true);
  }

  // // Fungsi Register User Untuk mendaftarkan user baru.
  register(BuildContext context) async {
    var params = {"email": emailController.text, "hp": nomorController.text, "firstname": firstNameController.text, "lastname": lastNameController.text, "grup": "member", "tgl_lahir": tanggalController.text, "jenis_kelamin": genderController.text == "Laki - laki " ? 1 : 2, "password": passwordController.text, "strict_password": false};
    final response = await dio.post(
      'http://202.157.184.201:8000/users',
      options: d.Options(
        contentType: 'application/json',
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        },
      ),
      data: jsonEncode(params),
    );

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Account Success Created',
          ),
          backgroundColor: Colors.black87,
        ),
      );
      clear();
      Get.offAll(
        const HomePage(),
      );
    } else if (response.statusCode == 400) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            response.data["status"]["kode"],
          ),
          backgroundColor: Colors.black87,
        ),
      );
    } else if (response.statusCode == 422) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            response.data["detail"],
          ),
          backgroundColor: Colors.black87,
        ),
      );
    } else if (response.statusCode == 404) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            response.data["status"]["keterangan"],
          ),
          backgroundColor: Colors.black87,
        ),
      );
    }
  }

  validateLogin(BuildContext context) {
    bool isEmail = c.isEmail(emailController.text);
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      if (isEmail) {
        login(context);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Please fill correct Email',
            ),
            backgroundColor: Colors.black87,
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Please Fill in the blank',
          ),
          backgroundColor: Colors.black87,
        ),
      );
    }
  }

  validateRegister(BuildContext context) {
    bool isEmail = c.isEmail(emailController.text);
    bool isPhone = c.isPhone(nomorController.text);
    bool isJustString = c.isStringOnlyLetters(firstNameController.text);
    bool isJustString2 = c.isStringOnlyLetters(lastNameController.text);
    if (emailController.text.isNotEmpty && firstNameController.text.isNotEmpty && lastNameController.text.isNotEmpty && genderController.text.isNotEmpty && tanggalController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      if (isEmail) {
        if (isPhone) {
          if (isJustString && isJustString2) {
            register(context);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  'Please fill the First Name or Last Name with only with Letters',
                ),
                backgroundColor: Colors.black87,
              ),
            );
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Please fill in the cellphone number column with the prefix 08...',
              ),
              backgroundColor: Colors.black87,
            ),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Please input correct Email',
            ),
            backgroundColor: Colors.black87,
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Please fill in the blank',
          ),
          backgroundColor: Colors.black87,
        ),
      );
    }
  }
}
