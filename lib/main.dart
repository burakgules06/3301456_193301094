import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/girisyap_controller.dart';
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

//sabit giderler
//scan etmek ve checklist, karekod eklenecek.
//faturalar için son ödeme tarihi için bilgilendirme gönderilecek.
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final girisyap_Controller = Get.put(GirisYap());
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
                controller: girisyap_Controller.email,
                decoration: InputDecoration(
                  hintText: "Telefon Numarası",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: girisyap_Controller.sifre,
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
                    await girisyap_Controller.girisYap();
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
}



/*import 'package:flutter/material.dart';
import 'page/Anasayfa.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}*/
