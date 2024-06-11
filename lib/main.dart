import 'package:dua/page/dua_page.dart';
import 'package:dua/page/koran_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dua/cubit/audio_cubit.dart';
import 'package:dua/cubit/not_book.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AudioCubit()),
        BlocProvider(create: (context) => NotBook()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: DuaPage(),
      ),
    );
  }
}
