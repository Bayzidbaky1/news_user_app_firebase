import 'package:flutter/material.dart';
import 'package:news_app/app_style/app_color.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPages extends StatefulWidget {
  const VideoPages({super.key});

  @override
  State<VideoPages> createState() => _VideoPagesState();
}

class _VideoPagesState extends State<VideoPages> {

  YoutubePlayerController ? _controller;

  @override
  void initState() {
    _controller = YoutubePlayerController(
      initialVideoId:'NturAshsKag',
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: true,
        isLive: false,
      )
      );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: _controller!,
        showVideoProgressIndicator: true,
        progressIndicatorColor: AppColor.button_color,
        progressColors: ProgressBarColors(
          playedColor: AppColor.button_color,
          handleColor: AppColor.button_color,
        ),
        ),
     builder: (_,player){
         return Scaffold(
           body: player,
         );
     });
  }
}