import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/data/models/video_model.dart';
import 'package:flutter_estrellas/app/themes/styles/colors.dart';
import 'package:video_player/video_player.dart';

/// Stateful widget to fetch and then display video content.
class VideoApp extends StatefulWidget {
  const VideoApp(
      {super.key, required this.videoModel, required this.onCompleted});

  final VideoModel videoModel;
  final Function() onCompleted;

  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  late VideoPlayerController _controller;
  double _currentSliderValue = 0.0;

  @override
  void initState() {
    super.initState();
    _controller =
        VideoPlayerController.networkUrl(Uri.parse(widget.videoModel.videoUrl))
          ..initialize().then((_) {
            // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
            setState(() {
              _controller.setLooping(true);
              _controller.play();
              _controller.addListener(() {
                if (_controller.value.isInitialized &&
                    _controller.value.isPlaying) {
                  setState(() {
                    // Actualizar el slider según el tiempo actual de reproducción
                    _currentSliderValue =
                        _controller.value.position.inSeconds.toDouble();
                  });
                  if (_controller.value.position >=
                      _controller.value.duration) {
                    widget.onCompleted();
                  }
                }
                //duracion total
                // {_controller.value.duration;

                // if (_controller.value.duration) {
                //   if (widget.onCompleted != null) {
                //     widget.onCompleted!();
                //   }
                // }
              });
            });
          });

    _controller.setVolume(100);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _controller.value.isInitialized
          ? Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.videoModel.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
              child: AspectRatio(
                aspectRatio: 9 / 16,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _controller.value.isPlaying
                          ? _controller.pause()
                          : _controller.play();
                    });
                  },
                  child: Stack(
                    children: [
                      VideoPlayer(_controller),
                      Column(
                        children: [
                          Slider(
                            activeColor:
                                primaryBase, // Cambia el color del slider
                            inactiveColor:
                                neutral400, // Color inactivo más claro

                            value: _currentSliderValue,
                            min: 0.0,
                            max:
                                _controller.value.duration.inSeconds.toDouble(),
                            onChanged: (value) {
                              setState(() {
                                _currentSliderValue = value;
                                // Saltar a la posición del slider
                                _controller
                                    .seekTo(Duration(seconds: value.toInt()));
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          : CachedNetworkImage(
              imageUrl: widget.videoModel.imageUrl,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
