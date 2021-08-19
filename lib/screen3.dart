import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:screens/screen5.dart';
import 'package:screens/screen7.dart';
import 'package:video_player/video_player.dart';

class Screen3 extends StatefulWidget {
  const Screen3({Key key}) : super(key: key);

  @override
  _Screen3State createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  VideoPlayerController _controller;

  @override
  void initState() {
    _controller = VideoPlayerController.asset(
      'assets/img/video.mp4',
    )..initialize().then((_) {
        setState(() {
          _controller.value.isPlaying
              ? _controller.pause()
              : _controller.play();
        });
      });

    _controller.setLooping(true);

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: size.height * 0.6,
            width: size.width,
            child: VideoPlayer(_controller),
          ),
          blackColumn(size),
        ],
      ),
    );
  }

  Column blackColumn(Size size) {
    return Column(
      children: [
        Container(
          height: size.height * 0.55,
          width: size.width * 0.95,
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //
              ///cross button
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => Screen7()));
                },
                child: Container(
                  height: 33,
                  width: 33,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black.withOpacity(0.5),
                  ),
                  child: Center(
                    child: Icon(
                      CupertinoIcons.clear,
                      size: 17,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              /////play/pause button
              InkWell(
                onTap: () {
                  setState(() {
                    _controller.value.isPlaying
                        ? _controller.pause()
                        : _controller.play();
                  });
                },
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black.withOpacity(0.5),
                  ),
                  child: Center(
                    child: Icon(
                      _controller.value.isPlaying
                          ? CupertinoIcons.pause_fill
                          : CupertinoIcons.play_fill,
                      size: 15,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        ///black container
        Container(
          height: size.height * 0.45,
          width: size.width,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //
                ///////Text
                Container(
                  width: size.width,
                  height: size.height * 0.12,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Become a Host in 10 easy steps',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: size.width * 0.07,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "Join us. We'll help you every step of the way.",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: size.width,
                  height: size.height * 0.06,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Color(0xffe51e4e),
                        textStyle: TextStyle(
                          fontSize: 20,
                        )),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => Screen5()));
                    },
                    child: Text(
                      "Let's go!",
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
