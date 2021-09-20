import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:musicplayer/src/helpers/helpers.dart';
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
          PlayTitle(),
          Expanded(child: Lyrics())
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
                  color: Color(0xffFE0240),
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

class PlayTitle extends StatelessWidget {
  const PlayTitle({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Text(
            "Save Your Tears",
            style: TextStyle(
              fontSize: 30,
              color: Colors.grey.withOpacity(0.9),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "-The Weeknd-",
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey.withOpacity(0.6),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ControllButtons(),
        ],
      ),
    );
  }
}

class Lyrics extends StatelessWidget {
  const Lyrics({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final lyrics = getLyrics();
    return Container(
        child: ListWheelScrollView(
      itemExtent: 42,
      diameterRatio: 1.5,
      physics: BouncingScrollPhysics(),
      children: lyrics
          .map((line) => Text(
                line,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey.withOpacity(0.9),
                ),
              ))
          .toList(),
    ));
  }
}

class ControllButtons extends StatelessWidget {
  const ControllButtons({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 50,
          margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.22),
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: Colors.grey[400],
              )),
        ),
        Container(
          margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.3),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(FontAwesomeIcons.angleDoubleLeft, size: 30),
              Container(
                height: 120,
                width: 90,
                child: FloatingActionButton(
                  backgroundColor: Color(0xffFE0240),
                  onPressed: () {},
                  child: Center(
                    child: Icon(FontAwesomeIcons.play,
                        color: Colors.white, size: 32),
                  ),
                ),
              ),
              Icon(FontAwesomeIcons.angleDoubleRight, size: 30),
            ],
          ),
        ),
      ],
    );
  }
}
