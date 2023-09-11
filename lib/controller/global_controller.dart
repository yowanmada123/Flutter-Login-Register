import 'package:get/get.dart';

class GlobalController extends GetxController {
  final isLogin = false.obs;

  // Fungsi untuk mengecek format only Letters
  bool isStringOnlyLetters(String str) {
    return str.trim().isNotEmpty && str.split('').every((char) => RegExp(r'^[a-zA-Z]+$').hasMatch(char));
  }

  // Fungsi untuk mengecek format email
  bool isEmail(String em) {
    String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(p);
    return regExp.hasMatch(em);
  }

  // Fungsi untuk mengecek suatu string apakah hanya terdiri dari sebua number,
  bool isNumber(String number) {
    String p = r'^[0-9]+$';
    RegExp regExp = RegExp(p);
    return regExp.hasMatch(number);
  }

  // Fungsi untuk mengecek format nomor dengan diawali dengan "+628"
  bool isPhone(String phone) {
    String q = r'^08[1-9][0-9]{6,10}$';
    RegExp regExp = RegExp(q);
    return regExp.hasMatch(phone);
  }

  // Fungsi untuk mengkalkulasi sebuah umur dari sebuah tanggal
  // String yourAge(DateTime birthday) {
  //   var duration = AgeCalculator.age(birthday, today: DateTime.now());
  //   return duration.years.toString();
  // }
}
