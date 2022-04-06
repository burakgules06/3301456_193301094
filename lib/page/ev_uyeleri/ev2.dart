// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class ev2 extends StatefulWidget {
  const ev2({Key? key}) : super(key: key);

  @override
  State<ev2> createState() => _ev2State();
}

class _ev2State extends State<ev2> {
  @override
  Widget build(BuildContext context) {
    String isim1 = "Rasim Burak Güleş";
    int ev1alacak = 75;
    int ev2alacak = 17;
    int totalalacak = ev1alacak + ev2alacak;
    int ev1verecek = 87;
    int ev2verecek = 37;
    int totalverecek = ev1verecek + ev2verecek;
    String iban = "TR33 0006 1005 1978 6457 8413 26";
    String bankaadi = "Ziraat Bankası";
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 175, 189, 235),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.white,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(isim1,
            style: const TextStyle(
                fontFamily: 'WorkSans', fontSize: 18.0, color: Colors.white)),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.more_horiz),
            onPressed: () {},
            color: Colors.white,
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height - 82.0,
                width: MediaQuery.of(context).size.width,
                color: Colors.transparent,
              ),
              Positioned(
                top: 75.0,
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(85.0),
                      topRight: Radius.circular(85.0),
                    ),
                    color: Colors.white,
                  ),
                  height: 550.0,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100.0),
                    child: const Image(
                      image: AssetImage("assets/plate2.png"),
                      fit: BoxFit.cover,
                      height: 150,
                      width: 150,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 220.0,
                left: 25.0,
                right: 25.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(isim1,
                        style: const TextStyle(
                            fontFamily: 'WorkSans',
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          children: [
                            Text(
                              "Alacağı ₺ = " + totalalacak.toString(),
                              style: const TextStyle(
                                fontFamily: 'WorkSans',
                                fontSize: 18.0,
                                color: Color.fromARGB(255, 73, 73, 73),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Container(height: 25.0, color: Colors.grey, width: 1.0),
                        Container(
                          child: Row(
                            children: <Widget>[
                              Text(
                                "Ödeyeceği ₺: " + totalverecek.toString(),
                                style: const TextStyle(
                                  fontFamily: 'WorkSans',
                                  fontSize: 17.0,
                                  color: Color.fromARGB(255, 73, 73, 73),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Column(
                            children: <Widget>[
                              Container(
                                width: 170,
                                height: 50,
                                child: Text(
                                    "İsmail Vahapoğlu ₺: " +
                                        ev1alacak.toString() +
                                        "\nMert Tanrıverdi ₺: " +
                                        ev2alacak.toString(),
                                    style: const TextStyle(
                                        fontFamily: 'WorkSans',
                                        fontSize: 14.0,
                                        color: Colors.grey)),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Column(
                            children: <Widget>[
                              Container(
                                width: 170,
                                height: 50,
                                child: Text(
                                    "İsmail Vahapoğlu ₺: " +
                                        ev1verecek.toString() +
                                        "\nMert Tanrıverdi ₺: " +
                                        ev2verecek.toString(),
                                    style: const TextStyle(
                                        fontFamily: 'WorkSans',
                                        fontSize: 14.0,
                                        color: Colors.grey)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: 35),
                          child: Row(
                            children: [
                              Text(
                                "IBAN : " + iban,
                                style: const TextStyle(
                                    fontFamily: 'WorkSans',
                                    fontSize: 16.0,
                                    color: Color.fromARGB(255, 78, 77, 77)),
                              ),
                              Container(
                                width: 10.0,
                              ),
                              Icon(Icons.copy),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: [
                            Text(
                              "Banka : " + bankaadi,
                              style: const TextStyle(
                                  fontFamily: 'WorkSans',
                                  fontSize: 16.0,
                                  color: Color.fromARGB(255, 107, 107, 107)),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 5.0, top: 100.0),
                      child: Container(
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                topRight: Radius.circular(10.0),
                                bottomLeft: Radius.circular(35.0),
                                bottomRight: Radius.circular(35.0)),
                            color: Color.fromARGB(255, 219, 120, 120)),
                        height: 70.0,
                        child: const Center(
                          child: Text('Hesaplaş',
                              style: TextStyle(
                                  fontSize: 25.0,
                                  color: Colors.white,
                                  fontFamily: 'WorkSans')),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
