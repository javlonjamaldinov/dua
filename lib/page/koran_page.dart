import 'package:dua/components/custom_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:audioplayers/audioplayers.dart' as audioplayers;
import 'package:dua/cubit/audio_cubit.dart';
import 'package:dua/cubit/not_book.dart';

class KoranPage extends StatefulWidget {
  const KoranPage({
    super.key,
  });

  @override
  State<KoranPage> createState() => _KoranPageState();
}

class _KoranPageState extends State<KoranPage> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Center(
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
      body: BlocBuilder<AudioCubit, audioplayers.PlayerState>(
        builder: (context, playerState) {
          return BlocBuilder<NotBook, BookmarkState>(
            builder: (context, isBookmarked) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.05,
                        vertical: screenWidth * 0.07,
                      ),
                      child: Container(
                        height: screenWidth * 0.13,
                        width: screenWidth * 0.9,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 25),
                              child: Text(
                                '2:126',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.share_outlined,
                                    color: Colors.blue,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    final audioBloc =
                                        BlocProvider.of<AudioCubit>(context);
                                    if (playerState ==
                                        audioplayers.PlayerState.playing) {
                                      audioBloc.pause();
                                    } else {
                                      audioBloc.play(
                                        audioplayers.AssetSource(
                                            "5632643310_6_tiktok.mp3"),
                                      );
                                    }
                                  },
                                  icon: Icon(
                                    playerState ==
                                            audioplayers.PlayerState.playing
                                        ? Icons.pause_outlined
                                        : Icons.play_arrow_outlined,
                                    color: Colors.blue,
                                    size: screenWidth * 0.08,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    BlocProvider.of<NotBook>(context)
                                        .toggleBookmark();
                                  },
                                  icon: Icon(
                                    isBookmarked == BookmarkState.bookmarked
                                        ? Icons.bookmark_outlined
                                        : Icons.bookmark_outline_sharp,
                                    color: Colors.blue,
                                    size: screenWidth * 0.07,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: screenWidth * 0.05),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.04,
                      ),
                      child: Text(
                        "رَبِّ اجۡعَلۡ ہٰذَا بَلَدًا اٰمِنًا وَّ ارۡزُقۡ اَہۡلَہٗ مِنَ الثَّمَرٰتِ مَنۡ",
                        style: TextStyle(
                          fontSize: screenWidth * 0.05,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: screenWidth * 0.005),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.05,
                      ),
                      child: Text(
                        "اٰمَنَ مِنۡہُمۡ بِاللّٰہِ وَ الۡیَوۡمِ الۡاٰخِرِ",
                        style: TextStyle(
                          fontSize: screenWidth * 0.05,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: screenWidth * 0.04),
                    const CustomDivider(),
                    SizedBox(height: screenWidth * 0.04),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.10,
                      ),
                      child: Text(
                        "“Оо, Раббим! Бул жерди тынч шаар кыла көр жана анын элинин арасынан Аллаhка жана Акырет күнгө ишенген адамдарды   (ар түркүн)   мөмө-жемиштер менен ырыскылант!”",
                        style: TextStyle(
                          fontSize: screenWidth * 0.040,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(height: screenWidth * 0.04),
                    const CustomDivider(),
                    SizedBox(height: screenWidth * 0.04),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.1,
                      ),
                      child: Text(
                        "Раббиж-’ал  хаза  Баладан  Ами-нау-уарзук ахлаху минас-самарати манн амана  минхум  бил-ЛЛахи уал Йаумил-Ахир",
                        style: TextStyle(
                          fontSize: screenWidth * 0.040,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
