import 'package:flutter/material.dart';
import 'package:musicplayer/src/widgets/custom_app_bar.dart';

class MusicaPlayerPage extends StatelessWidget {
  const MusicaPlayerPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [CustomAppBar(), ImageDiskAndDuration()],
      ),
    );
  }
}

class ImageDiskAndDuration extends StatelessWidget {
  const ImageDiskAndDuration({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          DiskImage()
          //TODO:BArRA PROGRESSO
        ],
      ),
    );
  }
}

class DiskImage extends StatelessWidget {
  const DiskImage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      width: 250,
      height: 250,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(200),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image(
                image: AssetImage("assets/album.jpg"),
              ),
              Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              Container(
                width: 18,
                height: 18,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ],
          )),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(200),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          colors: [
            Colors.grey[200],
            Colors.grey[50],
          ],
        ),
      ),
    );
  }
}
