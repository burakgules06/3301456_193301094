import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:get/get.dart';
import '../../Widget/Anasayfa.dart';
import '../../controller/kayitol_controller.dart';

class KayitOl extends StatefulWidget {
  const KayitOl({Key? key}) : super(key: key);

  @override
  State<KayitOl> createState() => _KayitOlState();
}

class _KayitOlState extends State<KayitOl> {
  final kayitol_Controller = Get.put(kayitOlController());

  bool sakla = true;
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
                      controller: kayitol_Controller.ad,
                      decoration: InputDecoration(
                        hintText: "Ad",
                      ),
                    ),
                    TextField(
                      controller: kayitol_Controller.soyad,
                      decoration: InputDecoration(
                        hintText: "Soyad",
                      ),
                    ),
                    TextField(
                      controller: kayitol_Controller.email,
                      decoration: InputDecoration(
                        hintText: "Telefon Numarası",
                      ),
                    ),
                    TextField(
                      controller: kayitol_Controller.sifre,
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
                      controller: kayitol_Controller.tekrarsifre,
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
                            await kayitol_Controller.hesapOlustur();
                            await kayitol_Controller.kayitOl();
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
                                    controller: kayitol_Controller.roomId,
                                  ),
                                  ElevatedButton(
                                      onPressed: () {
                                        kayitol_Controller.hesabaKatil();
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
