// ignore_for_file: prefer_adjacent_string_concatenation, unnecessary_string_escapes, non_constant_identifier_names, unused_local_variable

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/page/ev_uyeleri/ev1.dart';
import 'package:flutter_application_1/page/ev_uyeleri/ev2.dart';
import 'package:flutter_application_1/page/ev_uyeleri/ev3.dart';
import 'package:flutter_application_1/page/kisiBilgileri/kisiler.dart';
import 'package:flutter_application_1/transfer.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../page/fatura_bolmesi/tlEkle.dart';
import '../page/ev_uyeleri/hesabim.dart';
import 'altbar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
        automaticallyImplyLeading: false,
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
                const Text('Hesaplaş',
                    style: TextStyle(
                        fontFamily: 'WorkSans',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0)),
                Container(width: 10.0),
                const Text('üyeler',
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
              borderRadius: BorderRadius.only(topRight: Radius.circular(95.0)),
            ),
            child: StreamBuilder<List<Transfer>>(
                stream: readTransfer(),
                builder: (context, snapshot) {
                  if (snapshot.data != null) {
                    var transfers = snapshot.data;
                    var total = 0.0;
                    transfers!.forEach((element) =>
                        total += double.tryParse(element.borclar) ?? 0);
                    return SizedBox(
                        height: 400,
                        child: _buildListElement(context, transfers[0], total));
                  } else {
                    return Text('Veri yok');
                  }
                }),
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        height: 100,
        width: 100,
        child: FloatingActionButton(
          heroTag: "b1",
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

  SizedBox _buildListElement(
      BuildContext context, Transfer transfer, double total) {
    return SizedBox(
      height: 130,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 20.0,
          bottom: 20,
        ),
        child: ListView(
          padding: const EdgeInsets.only(left: 15.0, right: 20.0),
          children: [
            IconButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ev1())),
              iconSize: 86.0,
              icon: evUyeleri(
                "assets/plate1.jpg",
                "Ismail Hakkı Vahapoğlu",
                "Alacak : " + transfer.borclar.toString() ?? 0.toString(),
                "Verecek : " + total.toString() ?? 0.toString(),
              ),
            ),
          ],
        ),
      ),
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
        ],
      ),
    );
  }
}

Stream<List<Transfer>> readTransfer() => FirebaseFirestore.instance
    .collection('borclar')
    .snapshots()
    .map((snapshot) =>
        snapshot.docs.map((doc) => Transfer.fromJson(doc.data())).toList());
