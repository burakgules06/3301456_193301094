import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Widget/Anasayfa.dart';
import 'package:flutter_application_1/transfer.dart';

class SelectPage extends StatefulWidget {
  const SelectPage({Key? key}) : super(key: key);

  @override
  State<SelectPage> createState() => _SelectPageState();
}

class _SelectPageState extends State<SelectPage> {
  final controllerborclar = TextEditingController();
  final controlleralinanlar = TextEditingController();

  get handleClick => null;

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
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
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 40.0, top: 10.0),
            child: Row(
              children: <Widget>[
                Text(
                  "Fatura",
                  style: const TextStyle(
                      fontFamily: 'WorkSans',
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0),
                ),
                Container(width: 10.0),
                Text("Ekle",
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
              borderRadius: BorderRadius.only(topRight: Radius.circular(95.0)),
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
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: SizedBox(
                            child: TextField(
                              controller: controllerborclar,
                              decoration: InputDecoration(
                                hintText: "Tutar ₺",
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: SizedBox(
                            child: TextField(
                              controller: controlleralinanlar,
                              decoration: InputDecoration(
                                hintText: "Alınanlar (isteğe bağlı)",
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 25.0, top: 55),
                              child: FloatingActionButton(
                                heroTag: "btn1",
                                onPressed: () {
                                  final transfer = Transfer(
                                    borclar: controllerborclar.text,
                                    alinanlar: controlleralinanlar.text,
                                    email: user.email!,
                                  );
                                  createTransfer(transfer);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MyHomePage()));
                                },
                                backgroundColor:
                                    Color.fromARGB(255, 219, 120, 120),
                                child: const Icon(
                                  Icons.arrow_forward_ios,
                                ),
                              ),
                            ),
                          ],
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
    );
  }

  InputDecoration decoration(String label) => InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      );

  Future createTransfer(Transfer transfer) async {
    final docTransfer = FirebaseFirestore.instance.collection('borclar').doc();
    transfer.id = docTransfer.id;

    final json = transfer.toJson();
    await docTransfer.set(json);
  }
}
