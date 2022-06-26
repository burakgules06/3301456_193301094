// ignore_for_file: non_constant_identifier_names, camel_case_types

import 'package:flutter/material.dart';
import 'tlEkle.dart';
import '/page/altbar.dart';

class FaturaEkle extends StatefulWidget {
  const FaturaEkle({Key? key}) : super(key: key);

  @override
  State<FaturaEkle> createState() => _FaturaEkleState();
}

class _FaturaEkleState extends State<FaturaEkle> {
  @override
  Widget build(BuildContext context) {
    String kelime1 = "İsmail";
    String kelime2 = "Hakkı Vahapoğlu";
    void handleClick(String value) {
      switch (value) {
        case 'Logout':
          break;
        case 'Settings':
          break;
      }
    }

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios),
            color: Colors.white,
          ),
          elevation: 0,
          backgroundColor: const Color.fromARGB(255, 175, 189, 235),
          actions: <Widget>[
            PopupMenuButton<String>(
              onSelected: handleClick,
              itemBuilder: (BuildContext context) {
                return {'Logout', 'Settings'}.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
            ),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 175, 189, 235),
        body: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 40.0, top: 10.0),
              child: Row(
                children: <Widget>[
                  Text(
                    kelime1,
                    style: const TextStyle(
                        fontFamily: 'WorkSans',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0),
                  ),
                  Container(width: 10.0),
                  Text(kelime2,
                      style: const TextStyle(
                          fontFamily: 'WorkSans',
                          color: Colors.white,
                          fontSize: 25.0))
                ],
              ),
            ),
            Container(height: 30.0),
            Container(
              height: MediaQuery.of(context).size.height - 85.0,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.only(topRight: Radius.circular(95.0)),
              ),
              child: ListView(
                primary: false,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 20.0,
                      bottom: 20,
                    ),
                    child: SizedBox(
                      height: 500.0,
                      child: ListView(
                        padding: const EdgeInsets.only(left: 15.0, right: 20.0),
                        children: [
                          profilNesneleri(
                            "assets/plate2.png",
                            "Burak Güleş",
                            "Alacak:",
                            "Verecek:",
                          ),
                          const Padding(
                            padding: EdgeInsets.all(20),
                            child: SizedBox(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: "Tutar ₺",
                                ),
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(20),
                            child: SizedBox(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: "Alınanlar (isteğe bağlı)",
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(right: 25.0, top: 35),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                FloatingActionButton(
                                  heroTag: "btn1",
                                  onPressed: () {
                                    print("Hesap Ayarlandı!");
                                  },
                                  backgroundColor:
                                      Color.fromARGB(255, 219, 120, 120),
                                  child: const Icon(
                                    Icons.arrow_forward_ios,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: SizedBox(
          height: 100,
          width: 100,
          child: FloatingActionButton(
            heroTag: "btn2",
            backgroundColor: const Color.fromARGB(255, 255, 255, 255),
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const tlEkle())),
            child: const Icon(
              Icons.currency_lira,
              color: Colors.black,
              size: 90.0,
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: const altbar());
  }

  Widget profilNesneleri(
      String resim, String uyeAdi, String alacak, String Verecek) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(children: [
            Hero(
              tag: resim,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(60.0),
                child: Image(
                    image: AssetImage(resim),
                    fit: BoxFit.cover,
                    height: 65.0,
                    width: 65.0),
              ),
            ),
            const SizedBox(width: 10.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(uyeAdi,
                    style: const TextStyle(
                        fontFamily: 'WorkSans',
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold)),
                Text(alacak,
                    style: const TextStyle(
                        fontFamily: 'WorkSans',
                        fontSize: 15.0,
                        color: Colors.grey)),
                Text(Verecek,
                    style: const TextStyle(
                        fontFamily: 'WorkSans',
                        fontSize: 15.0,
                        color: Colors.grey)),
              ],
            )
          ]),
        ],
      ),
    );
  }
}
