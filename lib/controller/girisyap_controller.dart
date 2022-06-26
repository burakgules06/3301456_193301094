import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/Widget/Anasayfa.dart';
import 'package:flutter_application_1/page/ev_uyeleri/ev1.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class GirisYap extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController sifre = TextEditingController();

  girisYap() async {
    final res = await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: email.text)
        .where('sifre', isEqualTo: sifre.text)
        .get();

    if (res.docs.isNotEmpty) {
      Get.to(() => MyHomePage());
    } else {
      Get.showSnackbar(GetSnackBar(
          duration: Duration(milliseconds: 1500),
          title: 'HATA',
          message: 'Telefon numarası veya şifre yanlış'));
    }

    print(res.docs);
  }
}
