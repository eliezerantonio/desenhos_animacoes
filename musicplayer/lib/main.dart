import 'package:flutter/material.dart';
import 'package:musicplayer/helpers/theme.dart';

import 'src/pages/music_player_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music Player',
      debugShowCheckedModeBanner: false,
      theme: miTema,
      home: MusicaPlayerPage(),
    );
  }
}
