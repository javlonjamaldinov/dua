import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:audioplayers/audioplayers.dart' as audioplayers;
import 'package:dua/cubit/audio_cubit.dart';
import 'package:dua/cubit/not_book.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
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
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 35,
                      left: 20,
                      right: 20,
                    ),
                    child: Container(
                      height: 53,
                      width: 400,
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
                                    audioBloc.play(audioplayers.AssetSource(
                                        "5632643310_6_tiktok.mp3"));
                                  }
                                },
                                icon: Icon(
                                  playerState ==
                                          audioplayers.PlayerState.playing
                                      ? Icons.pause_outlined
                                      : Icons.play_arrow_outlined,
                                  color: Colors.blue,
                                  size: 30,
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
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "رَبِّ اجۡعَلۡ ہٰذَا بَلَدًا اٰمِنًا وَّ ارۡزُقۡ اَہۡلَہٗ مِنَ الثَّمَرٰتِ مَنۡ",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 3),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "اٰمَنَ مِنۡہُمۡ بِاللّٰہِ وَ الۡیَوۡمِ الۡاٰخِرِ",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 35),
                    child: Divider(),
                  ),
                  const SizedBox(height: 25),
                  const Padding(
                    padding: EdgeInsets.only(left: 29, right: 29),
                    child: Text(
                      "“Оо, Раббим! Бул жерди тынч шаар кыла көр жана анын элинин арасынан Аллаhка жана Акырет күнгө ишенген адамдарды (ар түркүн) мөмө-жемиштер менен ырыскылант!”",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 35),
                    child: Divider(),
                  ),
                  const SizedBox(height: 25),
                  const Padding(
                    padding: EdgeInsets.only(left: 33, right: 33),
                    child: Text(
                      "Раббиж-’ал хаза Баладан Ами-нау-уарзук ахлаху минас-самарати манн амана минхум бил-ЛЛахи уал Йаумил-Ахир",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
