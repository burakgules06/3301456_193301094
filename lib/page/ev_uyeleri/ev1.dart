// ignore_for_file: camel_case_types

<<<<<<< HEAD
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/transfer.dart';
=======
import 'package:flutter/material.dart';
>>>>>>> 1f25dde11161bc9d6b37270fab9d866468916e3f

class ev1 extends StatefulWidget {
  const ev1({Key? key}) : super(key: key);

  @override
  State<ev1> createState() => _ev1State();
}

class _ev1State extends State<ev1> {
  @override
  Widget build(BuildContext context) {
    String isim1 = "İsmail Hakkı Vahapoğlu";
<<<<<<< HEAD
=======
    int ev1alacak = 90;
    int ev2alacak = 50;
    int totalalacak = ev1alacak + ev2alacak;
    int ev1verecek = 37;
    int ev2verecek = 47;
    int totalverecek = ev1verecek + ev2verecek;
>>>>>>> 1f25dde11161bc9d6b37270fab9d866468916e3f
    String iban = "TR33 0006 1005 1978 6457 8413 26";
    String bankaadi = "İş Bankası";
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
                      image: AssetImage("assets/plate1.jpg"),
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
<<<<<<< HEAD
                        StreamBuilder<List<Transfer>>(
                            stream: readTransfer(),
                            builder: (context, snapshot) {
                              var total = 0.0;
                              if (snapshot.data != null) {
                                var transfers = snapshot.data;

                                transfers!.forEach((element) => total +=
                                    double.tryParse(element.borclar) ?? 0);
                              } else {
                                return Text('Veri yok');
                              }
                              return Container(
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      "Ödeyeceği ₺: " + total.toString(),
                                      style: const TextStyle(
                                        fontFamily: 'WorkSans',
                                        fontSize: 17.0,
                                        color: Color.fromARGB(255, 73, 73, 73),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                      ],
                    ),
                    Divider(
                      thickness: 1,
                      color: Colors.black,
                    ),
                    StreamBuilder<List<Transfer>>(
                        stream: readTransfer(),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            print(snapshot.error);
                            return const Text('biseyler yanlis gitti');
                          } else if (snapshot.hasData) {
                            final transfers = snapshot.data!;
                            return SizedBox(
                              height: 200,
                              child: ListView(
                                children: transfers.map(buildTransfer).toList(),
                              ),
                            );
                          } else {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                        }),
=======
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
                                    "Rasim Burak Güleş ₺: " +
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
                                    "Rasim Burak Güleş ₺: " +
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
>>>>>>> 1f25dde11161bc9d6b37270fab9d866468916e3f
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
<<<<<<< HEAD
                          padding: EdgeInsets.only(top: 20),
=======
                          padding: EdgeInsets.only(top: 35),
>>>>>>> 1f25dde11161bc9d6b37270fab9d866468916e3f
                          child: Row(
                            children: [
                              Text(
                                "IBAN : " + iban,
<<<<<<< HEAD
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontFamily: 'WorkSans',
                                    fontSize: 14,
=======
                                style: const TextStyle(
                                    fontFamily: 'WorkSans',
                                    fontSize: 16.0,
>>>>>>> 1f25dde11161bc9d6b37270fab9d866468916e3f
                                    color: Color.fromARGB(255, 78, 77, 77)),
                              ),
                              Container(
                                width: 10.0,
                              ),
<<<<<<< HEAD
                              IconButton(
                                onPressed: () {
                                  Clipboard.setData(ClipboardData(text: iban));
                                  final snackBar = SnackBar(
                                    content: const Text('Kopyalandı!'),
                                    action: SnackBarAction(
                                      label: 'Geri',
                                      onPressed: () {
                                        // Some code to undo the change.
                                      },
                                    ),
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                },
                                icon: Icon(Icons.copy),
                              ),
=======
                              Icon(Icons.copy),
>>>>>>> 1f25dde11161bc9d6b37270fab9d866468916e3f
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
<<<<<<< HEAD

  Widget buildTransfer(Transfer transfer) => Dismissible(
        onDismissed: (direction) => FirebaseFirestore.instance
            .collection('borclar')
            .doc(transfer.id)
            .delete(),
        key: UniqueKey(),
        child: InkWell(
          onLongPress: () => showDialog(
              context: context,
              builder: (context) {
                TextEditingController borcController = TextEditingController();
                return AlertDialog(
                  title: Text('Kalan Borç'),
                  content: Column(children: [
                    TextField(
                      controller: borcController,
                      decoration:
                          InputDecoration(hintText: 'Yeni Tutarı Giriniz₺ '),
                    ),
                    ElevatedButton(
                        onPressed: () => FirebaseFirestore.instance
                                .collection('borclar')
                                .doc(transfer.id)
                                .update({
                              'borclar': borcController.text
                            }).whenComplete(() => Navigator.pop(context)),
                        child: Text('Güncelle'))
                  ]),
                );
              }),
          child: ListTile(
            leading: Text(transfer.borclar.toString()),
            title: Text(transfer.alinanlar.toString()),
            subtitle: Text(transfer.email.toString()),
          ),
        ),
      );
  Stream<List<Transfer>> readTransfer() => FirebaseFirestore.instance
      .collection('borclar')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Transfer.fromJson(doc.data())).toList());
=======
>>>>>>> 1f25dde11161bc9d6b37270fab9d866468916e3f
}
