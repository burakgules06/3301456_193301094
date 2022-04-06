// ignore_for_file: prefer_const_constructors, camel_case_types, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import '/page/altbar.dart';
import 'tlEkle2.dart';
import '/page/Anasayfa.dart';

class tlEkle extends StatefulWidget {
  const tlEkle({Key? key}) : super(key: key);

  @override
  State<tlEkle> createState() => _tlEkleState();
}

var selectedCard = 'Mutfak';

class _tlEkleState extends State<tlEkle> {
  @override
  Widget build(BuildContext context) {
    String kelime1 = "Borç";
    String kelime2 = "Ekle";
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
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MyHomePage()));
            },
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.white,
          ),
          elevation: 0,
          backgroundColor: Color.fromARGB(255, 175, 189, 235),
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
              height: MediaQuery.of(context).size.height - 214.0,
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
                    padding: EdgeInsets.all(40),
                    child: Container(
                        height: 150.0,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            _buildInfoCard(
                              'Mutfak',
                              Icons.cookie,
                            ),
                            SizedBox(width: 10.0),
                            _buildInfoCard('Temizlik', Icons.clean_hands),
                          ],
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 115),
                    child: Container(
                        height: 150.0,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            SizedBox(width: 10.0),
                            _buildInfoCard(
                              'Keyfi',
                              Icons.child_care_sharp,
                            ),
                          ],
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        FloatingActionButton(
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const tlEkle2())),
                          backgroundColor: Color.fromARGB(255, 219, 120, 120),
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
          ],
        ),
        floatingActionButton: SizedBox(
          height: 100,
          width: 100,
          child: FloatingActionButton(
            heroTag: null,
            backgroundColor: const Color.fromARGB(255, 255, 255, 255),
            onPressed: () {},
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

  Widget _buildInfoCard(String cardTitle, IconData ikon) {
    return InkWell(
      onTap: () {
        selectCard(cardTitle);
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        curve: Curves.easeIn,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: cardTitle == selectedCard
              ? Color.fromARGB(255, 219, 120, 120)
              : Colors.white,
          border: Border.all(
              color: cardTitle == selectedCard
                  ? Colors.transparent
                  : Colors.grey.withOpacity(0.3),
              style: BorderStyle.solid,
              width: 1.75),
        ),
        height: 100.0,
        width: 150.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 10.0),
              child: Text(cardTitle,
                  style: TextStyle(
                    fontFamily: 'WorkSans',
                    fontSize: 15.0,
                    color: cardTitle == selectedCard
                        ? Colors.white
                        : Color.fromARGB(255, 0, 0, 0).withOpacity(0.7),
                  )),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Icon(
                  ikon,
                  size: 80,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  selectCard(cardTitle) {
    setState(() {
      selectedCard = cardTitle;
    });
  }
}
