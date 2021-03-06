import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/page/kisiBilgileri/kayitol.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'Widget/Anasayfa.dart';
import 'page/kisiBilgileri/kayitol.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: LoginPage(),
  ));
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController sifre = TextEditingController();

  bool sakla = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 175, 189, 235),
      body: Stack(
        children: [
          const Padding(
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
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.35),
            width: double.infinity,
            height: 550,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50.0),
                  topRight: Radius.circular(50.0)),
            ),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text(
                "Giriş Yap",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: email,
                decoration: InputDecoration(
                  hintText: "Telefon Numarası",
                ),
              ),
              const SizedBox(
                height: 20,
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
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Şifremi Unuttum?",
                    style: TextStyle(color: Color.fromARGB(255, 219, 120, 120)),
                  ),
                ),
              ),
              Center(
                child: ElevatedButton(
                  style: TextButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 219, 120, 120),
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 50)),
                  onPressed: () async {
                    await girisYap();
                  },
                  child: const Text("Giriş Yap"),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Hesabınız yok mu"),
                  TextButton(
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const KayitOl())),
                      child: const Text(
                        "Kayıt Ol?",
                        style: TextStyle(
                            color: Color.fromARGB(255, 219, 120, 120)),
                      ))
                ],
              )
            ]),
          )
        ],
      ),
    );
  }

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
