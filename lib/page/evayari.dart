import 'package:flutter/material.dart';
import 'fatura_bolmesi/tlEkle.dart';
import 'altbar.dart';

class evAyari extends StatefulWidget {
  const evAyari({Key? key}) : super(key: key);

  @override
  State<evAyari> createState() => _evAyariState();
}

class _evAyariState extends State<evAyari> {
  @override
  Widget build(BuildContext context) {
    String kelime1 = "Ev";
    String kelime2 = "Değişkenleri";
    final List<Widget> screens = [
      const evAyari(),
      const evAyari(),
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
          backgroundColor: Color.fromARGB(255, 134, 105, 105),
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
        backgroundColor: const Color.fromARGB(255, 134, 105, 105),
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
                      top: 45.0,
                      bottom: 20,
                    ),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height - 280.0,
                      child: ListView(
                        padding: const EdgeInsets.only(left: 25.0, right: 20.0),
                        children: [],
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
        bottomNavigationBar: altbar());
  }
}
