import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/model/kayit_model.dart';
import 'package:get/get.dart';
import '../../Widget/Anasayfa.dart';

class KayitOl extends StatefulWidget {
  const KayitOl({Key? key}) : super(key: key);

  @override
  State<KayitOl> createState() => _KayitOlState();
}

class _KayitOlState extends State<KayitOl> {
  bool sakla = true;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 175, 189, 235),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: const Padding(
              padding: EdgeInsets.only(top: 90.0, left: 30.0),
              child: Text(
                "Ev \nArkadaşım ",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.01),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50.0),
                    topRight: Radius.circular(50.0)),
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Kayıt Ol",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: ad,
                      decoration: InputDecoration(
                        hintText: "Ad",
                      ),
                    ),
                    TextField(
                      controller: soyad,
                      decoration: InputDecoration(
                        hintText: "Soyad",
                      ),
                    ),
                    TextField(
                      controller: email,
                      decoration: InputDecoration(
                        hintText: "Telefon Numarası",
                      ),
                    ),
                    TextField(
                      controller: sifre,
                      cursorColor: const Color.fromARGB(255, 219, 120, 120),
                      obscureText: sakla,
                      decoration: InputDecoration(
                          hintText: "Şifre",
                          suffixIcon: IconButton(
                              color: const Color.fromARGB(255, 219, 120, 120),
                              onPressed: () {
                                setState(() {
                                  sakla = !sakla;
                                });
                              },
                              icon: sakla
                                  ? const Icon(Icons.visibility_off)
                                  : const Icon(Icons.visibility))),
                    ),
                    TextField(
                      controller: tekrarsifre,
                      cursorColor: const Color.fromARGB(255, 219, 120, 120),
                      obscureText: sakla,
                      decoration: InputDecoration(
                        hintText: "Tekrar Şifre",
                      ),
                    ),
                    Row(
                      children: [
                        ElevatedButton(
                          style: TextButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 219, 120, 120),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 50)),
                          onPressed: () async {
                            await hesapOlustur();
                            await kayitOl();
                            Get.to(() => LoginPage());
                          },
                          child: const Text("Hesap Oluştur"),
                        ),
                        ElevatedButton(
                          style: TextButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 219, 120, 120),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 50)),
                          onPressed: () async {
                            Get.defaultDialog(
                              title: "ODA ID:",
                              content: Column(
                                children: [
                                  TextField(
                                    controller: roomId,
                                  ),
                                  ElevatedButton(
                                      onPressed: () {
                                        hesabaKatil();
                                      },
                                      child: Text("Katıl"))
                                ],
                              ),
                            );
                            //await kayitol_Controller.kayitOl();
                          },
                          child: const Text("Hesaba Katıl"),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Aramıza Hoş geldin :)",
                          style: TextStyle(
                              color: Color.fromARGB(255, 219, 120, 120)),
                        )
                      ],
                    )
                  ]),
            ),
          )
        ],
      ),
    );
  }
}
