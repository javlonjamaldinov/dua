import 'package:dua/page/prayers_quran.dart';
import 'package:flutter/material.dart';
import 'package:dua/components/dua_container.dart';
import 'package:dua/content.dart';

class DuaPage extends StatelessWidget {
  const DuaPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double itemHeight = (screenSize.height - kToolbarHeight - 25) / 8;
    final double itemWidth = screenSize.width / 2;

    return Scaffold(
      backgroundColor: ContentColors.white,
      appBar: AppBar(
        backgroundColor: ContentColors.white,
        title: const Center(
          child: Padding(
            padding: EdgeInsets.only(
              top: 10,
            ),
            child: Text(
              "Дуалар",
              style: TextStyle(color: ContentColors.blue, fontSize: 25),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 25),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 1,
            mainAxisSpacing: 20,
            childAspectRatio: itemWidth / itemHeight,
          ),
          itemCount: 8,
          itemBuilder: (BuildContext context, int index) {
            DuaContainer duaContainer;
            switch (index) {
              case 0:
                duaContainer = DuaContainer(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PrayersQuran(),
                      ),
                    );
                  },
                  text: 'Курандагы \n дуалар',
                  textColor: ContentColors.blue,
                );
                break;
              case 1:
                duaContainer = DuaContainer(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PrayersQuran(),
                      ),
                    );
                  },
                  text: "Күнүмдүк \n дуалар",
                  textColor: ContentColors.blue,
                );
              case 2:
                duaContainer = DuaContainer(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PrayersQuran(),
                      ),
                    );
                  },
                  text: "Таңкы \n зикирлер",
                  textColor: ContentColors.blue,
                );
              case 3:
                duaContainer = DuaContainer(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PrayersQuran(),
                      ),
                    );
                  },
                  text: "Кечки \n зикирлер",
                  textColor: ContentColors.blue,
                );
              case 4:
                duaContainer = DuaContainer(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PrayersQuran(),
                      ),
                    );
                  },
                  text: "Азан дуасы",
                  textColor: ContentColors.blue,
                );
              case 5:
                duaContainer = DuaContainer(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PrayersQuran(),
                      ),
                    );
                  },
                  text: "Сапар дуасы",
                  textColor: ContentColors.blue,
                );
              case 6:
                duaContainer = DuaContainer(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PrayersQuran(),
                      ),
                    );
                  },
                  text: "Истихара \n дуасы",
                  textColor: ContentColors.blue,
                );
              case 7:
                duaContainer = DuaContainer(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PrayersQuran(),
                      ),
                    );
                  },
                  text: "Рамазан",
                  textColor: ContentColors.blue,
                );
                break;
              default:
                duaContainer = DuaContainer(
                  onTap: () {},
                  text: 'Text $index',
                  textColor: ContentColors.blue,
                );
            }
            return SizedBox(
              height: itemHeight,
              width: itemWidth,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 5,
                ),
                child: duaContainer,
              ),
            );
          },
        ),
      ),
    );
  }
}
