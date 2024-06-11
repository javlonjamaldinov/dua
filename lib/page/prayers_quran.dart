import 'package:dua/content.dart';
import 'package:dua/page/koran_page.dart';
import 'package:flutter/material.dart';

class PrayersQuran extends StatelessWidget {
  PrayersQuran({
    super.key,
  });

  final List<String> prayers = [
    'Бакара 2:127-128',
    'Бакара 2:127-128',
    'Бакара 2:127-128',
  ];

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    const double itemHeight = 70;
    final double itemWidth = screenSize.width - 30;

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Padding(
            padding: EdgeInsets.only(right: 15),
            child: Text(
              "Курандагы дуалар",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: ListView.builder(
          itemCount: prayers.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                switch (index) {
                  case 0:
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const KoranPage(),
                      ),
                    );
                    break;
                  case 1:
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => PrayersQuranDetails2(prayer: prayers[index]),
                    //   ),
                    // );
                    break;
                  case 2:
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => PrayersQuranDetails3(prayer: prayers[index]),
                    //   ),
                    // );
                    break;
                  default:
                    break;
                }
              },
              child: Container(
                height: itemHeight,
                width: itemWidth,
                margin: EdgeInsets.only(
                    bottom: index == prayers.length - 1 ? 0 : 20,
                    left: 10,
                    right: 20),
                decoration: BoxDecoration(
                  color: ContentColors.blue,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    prayers[index],
                    style: const TextStyle(
                      fontSize: 18,
                      color: ContentColors.white,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
