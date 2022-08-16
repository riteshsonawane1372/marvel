import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayer extends StatefulWidget {
  const VideoPlayer({Key? key}) : super(key: key);

  @override
  _VideoPlayerState createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {

  VideoPlayerController controller ;
  late final String url;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller= VideoPlayerController.network("${url}")
    ..addListener(() {
      setState(() {
      });
    })
    ..setLooping((false))
    ..initialize().then((value) => controller.play());

    ;
  }

  @override
  Widget build(BuildContext context) {
    return VideoPlayerWidget(controller : controller );
  }
}
