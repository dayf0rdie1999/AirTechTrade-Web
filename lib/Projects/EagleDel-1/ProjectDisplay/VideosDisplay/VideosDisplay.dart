import 'package:animated_icon_button/animated_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_app/Projects/EagleDel-1/ProjectDisplay/VideosDisplay/VideoPlayer.dart';
import 'package:video_player/video_player.dart';

class VideosDisplay extends StatefulWidget {
  const VideosDisplay({Key? key}) : super(key: key);

  @override
  State<VideosDisplay> createState() => _VideosDisplayState();
}

class _VideosDisplayState extends State<VideosDisplay> {

  late VideoPlayerController _controller;

  late bool isVideoHovered;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    isVideoHovered = false;

    _controller = VideoPlayerController.asset("assets/videos/EagleDel.mp4");
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (details) {
        setState(() {
          isVideoHovered = true;
        });
      },
      onExit: (details) {
        setState(() {
          isVideoHovered = false;
        });
      },
      child: Container(
        height: 400.0,
        child: Stack(
          alignment: Alignment.center,
          children: [
            FutureVideoPlayer(controller: _controller),
            isVideoHovered
                ? AnimatedIconButton(
                    size: 64.0,
                    initialIcon: _controller.value.isPlaying ? 1 : 0,
                    icons: [
                        AnimatedIconItem(
                          icon: Icon(Icons.play_arrow),
                          onPressed: () => _controller.play(),
                        ),
                        AnimatedIconItem(
                          icon: Icon(Icons.pause),
                          onPressed: () => _controller.pause(),
                        ),
                      ])
            : Container(),
          ],
        ),
      ),
    );
  }
}
