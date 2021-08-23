import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_trailers/api/api.dart';
import 'package:movie_trailers/constants/colors.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';


class Video extends StatefulWidget {
  const Video({Key? key}) : super(key: key);

  @override
  _VideoState createState() => _VideoState();
}

class _VideoState extends State<Video> {
  YoutubePlayerController? _controller;
  Map data = {};
  var count = 0;

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeLeft]);
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  }

  @override
  Widget build(BuildContext context) {
    count++;
    data = ModalRoute.of(context)!.settings.arguments as Map;
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId("https://www.youtube.com/watch?v=${data["key"]}").toString(),// BBAyRBTfsOU,
      flags: YoutubePlayerFlags(
        autoPlay: true,
      ),
    );

    return SafeArea(
      child: Scaffold(
        backgroundColor: blackColor,
          body: Container(
            child: YoutubePlayerBuilder(
              player: YoutubePlayer(
                controller: _controller!,
              ),
              builder: (context, player){
                return YoutubePlayer(
                  controller: _controller!,
                  showVideoProgressIndicator: true,
                );
              }
            ),
          ),
      ),
    );
  }
}
