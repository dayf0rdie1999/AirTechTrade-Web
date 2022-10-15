import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:video_player/video_player.dart';

class FutureVideoPlayer extends StatefulWidget {
  final VideoPlayerController controller;

  const FutureVideoPlayer({Key? key, required this.controller}) : super(key: key);

  @override
  State<FutureVideoPlayer> createState() => _FutureVideoPlayerState();
}

class _FutureVideoPlayerState extends State<FutureVideoPlayer> {
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _initializeVideoPlayerFuture = widget.controller.initialize();
  }

  @override
  void dispose() {
    widget.controller.dispose();

    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          // If the VideoPlayerController has finished initialization, use
          // the data it provides to limit the aspect ratio of the video.
          return VideoPlayer(widget.controller);
        } else {
          // If the VideoPlayerController is still initializing, show a
          // loading spinner.
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
