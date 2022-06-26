import 'package:flutter/material.dart';
import 'package:flutter_application_1/page/Anasayfa.dart';
import 'fatura_bolmesi/tlEkle.dart';
import 'evayari.dart';
import 'hesabim.dart';

class altbar extends StatelessWidget {
  const altbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      const evAyari(),
      const tlEkle(),
      const hesabim(),
    ];

    return BottomAppBar(
      color: const Color.fromARGB(255, 255, 255, 255),
      shape: const CircularNotchedRectangle(),
      notchMargin: 10,
      child: SizedBox(
        height: 65,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MaterialButton(
              minWidth: 160,
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MyHomePage())),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.home,
                    size: 40.0,
                  ),
                ],
              ),
            ),
            MaterialButton(
              minWidth: 160,
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const hesabim())),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.person,
                    size: 40.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
