import 'package:flutter/material.dart';
import 'package:musicplayer/src/widgets/custom_app_bar.dart';

class MusicaPlayerPage extends StatelessWidget {
  const MusicaPlayerPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(),
          ImageDiskAndDuration(),
        ],
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
      padding: EdgeInsets.symmetric(horizontal: 30),
      margin: EdgeInsets.only(top: 70),
      child: Row(
        children: [
          DiskImage(),
          SizedBox(width: 30),
          ProgressBar(),
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

class ProgressBar extends StatelessWidget {
  const ProgressBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text("00:00", style: buildTextStyle()),
          const SizedBox(height: 10),
          Stack(
            children: [
              Container(
                width: 3,
                height: 230,
                color: Colors.grey[400].withOpacity(0.3),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  width: 3,
                  height: 150,
                  color: Colors.grey[400].withOpacity(0.8),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            "00:00",
            style: buildTextStyle(),
          ),
        ],
      ),
    );
  }

  TextStyle buildTextStyle() {
    return TextStyle(
      color: Colors.grey.withOpacity(0.8),
    );
  }
}
