import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/page/kisiBilgileri/kayitOl.dart';
import 'package:get/get.dart';

class kayitOlController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController sifre = TextEditingController();

  TextEditingController ad = TextEditingController();
  TextEditingController soyad = TextEditingController();
  TextEditingController tekrarsifre = TextEditingController();
  TextEditingController roomId = TextEditingController();
  DocumentReference<Map<String, dynamic>>? user;

  QuerySnapshot<Map<String, dynamic>>? userModel;

  Future kayitOl() async {
    final kayitOlModel = KayitOlModel(
        email: email.text, sifre: sifre.text, ad: ad.text, soyad: soyad.text);
    final auth = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.text, password: sifre.text);
    final res = await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: email.text)
        .get();
    update();

    if (res.docs.isNotEmpty) {
      Get.showSnackbar(const GetSnackBar(
        duration: Duration(milliseconds: 1500),
        title: 'HATA',
        message: 'Bu telefon numarasıyla oluşturulmuş bir hesap mevcut.',
      ));
      return;
    } else {
      user = await FirebaseFirestore.instance
          .collection('users')
          .add(kayitOlModel.toMap());
    }
  }

  Future hesapOlustur() async {
    final reqModel = HesapModel(id: DateTime.now().millisecondsSinceEpoch);
    await FirebaseFirestore.instance.collection('rooms').add(reqModel.toMap());
  }

  Future hesabaKatil() async {
    kayitOl().then((value) async {
      final hesapno = await FirebaseFirestore.instance
          .collection('rooms')
          .doc(roomId.text)
          .get();

      if (!hesapno.exists) {
        Get.back();
        Get.showSnackbar(const GetSnackBar(
          title: 'HATA',
          message: 'Böyle bir oda bulunamadı.',
          duration: Duration(milliseconds: 1500),
        ));
        return;
      } else {
        final model = <String, dynamic>{
          'users': FieldValue.arrayUnion([user!.id])
        };
        await FirebaseFirestore.instance
            .collection('rooms')
            .doc(roomId.text)
            .update(model);
      }
    });
  }
}

class HesapModel {
  late int id;

  HesapModel({required this.id});

  toMap() {
    return {'roomId': id};
  }
}

class KayitOlModel {
  late String ad;
  late String soyad;
  late String email;
  late String sifre;

  KayitOlModel(
      {required this.email,
      required this.sifre,
      required this.ad,
      required this.soyad});

  Map<String, String> toMap() {
    return {
      'ad': ad,
      'soyad': soyad,
      'email': email,
      'sifre': sifre,
    };
  }
}
