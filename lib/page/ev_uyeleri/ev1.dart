// ignore_for_file: camel_case_types

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/system.dart';

class ev1 extends StatefulWidget {
  const ev1({Key? key}) : super(key: key);

  @override
  State<ev1> createState() => _ev1State();
}

class _ev1State extends State<ev1> {
  @override
  Widget build(BuildContext context) {
    String isim1 = "İsmail Hakkı Vahapoğlu";
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
                        StreamBuilder<List<System>>(
                            stream: readSystems(),
                            builder: (context, snapshot) {
                              var systems = snapshot.data!;
                              var total = 0.0;
                              systems.forEach((element) => total +=
                                  double.tryParse(element.borclar) ?? 0);
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
                    StreamBuilder<List<System>>(
                        stream: readSystems(),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            print(snapshot.error);
                            return const Text('biseyler yanlis gitti');
                          } else if (snapshot.hasData) {
                            final systems = snapshot.data!;
                            return SizedBox(
                              height: 200,
                              child: ListView(
                                children: systems.map(buildSystem).toList(),
                              ),
                            );
                          } else {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                        }),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Row(
                            children: [
                              Text(
                                "IBAN : " + iban,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontFamily: 'WorkSans',
                                    fontSize: 14,
                                    color: Color.fromARGB(255, 78, 77, 77)),
                              ),
                              Container(
                                width: 10.0,
                              ),
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

  Widget buildSystem(System system) => Dismissible(
        onDismissed: (direction) => FirebaseFirestore.instance
            .collection('borclar')
            .doc(system.id)
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
                                .doc(system.id)
                                .update({
                              'borclar': borcController.text
                            }).whenComplete(() => Navigator.pop(context)),
                        child: Text('Güncelle'))
                  ]),
                );
              }),
          child: ListTile(
            leading: Text(system.borclar.toString()),
            title: Text(system.alinanlar.toString()),
            subtitle: Text(system.email.toString()),
          ),
        ),
      );
  Stream<List<System>> readSystems() => FirebaseFirestore.instance
      .collection('borclar')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => System.fromJson(doc.data())).toList());
}
