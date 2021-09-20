import 'package:flutter/material.dart';
import 'package:musicplayer/helpers/theme.dart';
import 'package:musicplayer/src/models/audio_player_model.dart';
import 'package:provider/provider.dart';

import 'src/pages/music_player_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => AudioPlayerModel())],
      child: MaterialApp(
        title: 'Music Player',
        debugShowCheckedModeBanner: false,
        theme: miTema,
        home: MusicaPlayerPage(),
      ),
    );
  }
}
