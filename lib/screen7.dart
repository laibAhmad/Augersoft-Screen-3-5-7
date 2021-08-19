import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Screen7 extends StatefulWidget {
  const Screen7({Key key}) : super(key: key);

  @override
  _Screen7State createState() => _Screen7State();
}

class _Screen7State extends State<Screen7> {
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
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: size.height * 0.6,
              width: size.width,
              child: VideoPlayer(_controller),
            ),
            whiteColumn(size),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: size.height * 0.1,
        width: size.width,
        decoration: BoxDecoration(
            border: Border(
          top: BorderSide(width: 1),
        )),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Back',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.grey[400] ?? Color(0xffe51e4e),
                    elevation: 0,
                    textStyle: TextStyle(
                      fontSize: 15,
                    )),
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text('Next'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column whiteColumn(Size size) {
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
              /////top row of cross and help button
              topButtons(),

              ////play/pause button and text column
              textAndButton(size)
            ],
          ),
        ),

        ////white container
        Container(
          height: size.height * 0.45,
          width: size.width,
          padding: EdgeInsets.symmetric(vertical: 25, horizontal: 8),
          decoration: BoxDecoration(
            color: Colors.white,
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
                ///////upload and take photos buttons
                Container(
                  width: size.width,
                  height: size.height * 0.20,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ///
                      ///////Upload Photos button
                      InkWell(
                        onTap: () {
                          ///
                        },
                        child: Container(
                          height: size.height * 0.08,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Colors.grey[350],
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Icon(
                                  CupertinoIcons.arrow_up_to_line_alt,
                                  size: size.width * 0.07,
                                ),
                              ),
                              Text(
                                'Upload Photos',
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),

                      ///////Take Photos button
                      InkWell(
                        onTap: () {
                          ///
                        },
                        child: Container(
                          height: size.height * 0.08,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Colors.grey[350],
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Icon(
                                  CupertinoIcons.photo_camera,
                                  size: size.width * 0.07,
                                ),
                              ),
                              Text(
                                'Take New Photos',
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Column textAndButton(Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: InkWell(
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
        ),
        Text(
          "Next, let's add some photos of your place",
          style: TextStyle(
            color: Colors.white,
            fontSize: size.width * 0.06,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Row topButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            Navigator.pop(context);
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
        Container(
          // height: 33,
          // width: 33,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            color: Colors.black.withOpacity(0.5),
          ),
          child: Center(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            child: Text(
              'Help',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          )),
        ),
      ],
    );
  }
}
