// ignore_for_file: prefer_adjacent_string_concatenation, unnecessary_string_escapes, non_constant_identifier_names, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_application_1/page/ev_uyeleri/ev1.dart';
import 'package:flutter_application_1/page/ev_uyeleri/ev2.dart';
import 'package:flutter_application_1/page/ev_uyeleri/ev3.dart';
import 'package:flutter_application_1/page/fatura_bolmesi/gg-ekle.dart';
import 'tlEkle.dart';
import '../ev_uyeleri/hesabim.dart';
import '../../Widget/altbar.dart';

class tlEkle2 extends StatefulWidget {
  const tlEkle2({Key? key}) : super(key: key);

  @override
  _tlEkle2State createState() => _tlEkle2State();
}

class _tlEkle2State extends State<tlEkle2> {
  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      const tlEkle(),
      const hesabim(),
    ];
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
                const Text('Kişi',
                    style: TextStyle(
                        fontFamily: 'WorkSans',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0)),
                Container(width: 10.0),
                const Text('Seç',
                    style: TextStyle(
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
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(95.0),
                  topLeft: Radius.circular(95.0)),
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
                    height: 420.0,
                    child: ListView(
                      padding: const EdgeInsets.only(left: 15.0, right: 20.0),
                      children: [
                        IconButton(
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SelectPage())),
                          iconSize: 86.0,
                          icon: evUyeleri(
                            "assets/housee.png",
                            "Ev Hesabı",
                            "",
                            "",
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
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          onPressed: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => const tlEkle())),
          child: const Icon(
            Icons.currency_lira,
            color: Colors.black,
            size: 90.0,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const altbar(),
    );
  }

  Widget evUyeleri(String resim, String uyeAdi, String alacak, String Verecek) {
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
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
            ])
          ]),
          IconButton(
            icon: Icon(Icons.add),
            color: Colors.black,
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SelectPage())),
            iconSize: 30,
          )
        ],
      ),
    );
  }
}
