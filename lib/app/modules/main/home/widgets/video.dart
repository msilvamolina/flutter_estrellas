import 'dart:io';
import 'dart:typed_data';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/app/controllers/main_controller.dart';
import 'package:flutter_estrellas/app/data/models/video_model.dart';
import 'package:flutter_estrellas/app/themes/styles/colors.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../../../../../main.dart';
import '../../../../data/models/videos/video_post_model.dart';
import 'video_buttons.dart';
import 'video_label.dart';

class VideoApp extends StatefulWidget {
  const VideoApp({
    required this.videoPostModel,
    required this.onCompleted,
    this.bottomSpace = true,
    super.key,
  });

  final VideoPostModel videoPostModel;
  final Function() onCompleted;
  final bool bottomSpace;
  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> with RouteAware {
  late VideoPlayerController _controller;
  double _currentSliderValue = 0.0;
  bool _isPlaying = true;
  MainController mainController = Get.find();

  bool _iconAnimationShowing = false;
  IconData _iconAnimationIcon = Icons.pause;

  @override
  void initState() {
    super.initState();

    // Configuración del controlador de video
    _controller = VideoPlayerController.networkUrl(
      Uri.parse(widget.videoPostModel.videoUrl),
    )..initialize().then((_) {
        if (mounted) {
          setState(() {
            _controller.setLooping(true);
            _controller.play();
          });
        }
      });

    _controller.setVolume(mainController.withVolume ? 100 : 0);

    // Listener para actualizar el slider
    _controller.addListener(_videoListener);
  }

  void _videoListener() {
    if (mounted &&
        _controller.value.isInitialized &&
        _controller.value.isPlaying) {
      setState(() {
        _currentSliderValue = _controller.value.position.inSeconds.toDouble();
      });
    }
  }

  @override
  void dispose() {
    // Limpieza de recursos
    _controller.removeListener(_videoListener);
    _controller.dispose();
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final route = ModalRoute.of(context);
    if (route is PageRoute<dynamic>) {
      routeObserver.subscribe(this, route);
    }
  }

  @override
  void didPushNext() {
    if (_controller.value.isPlaying) {
      _controller.pause();
      if (mounted) {
        setState(() {
          _isPlaying = false;
        });
      }
    }
  }

  @override
  void didPopNext() {
    if (!_isPlaying) {
      _controller.play();
      if (mounted) {
        setState(() {
          _isPlaying = true;
        });
      }
    }
  }

  void onPause() {
    if (!mounted) return;

    setState(() {
      _isPlaying = !_controller.value.isPlaying;
      if (_isPlaying) {
        _controller.play();
      } else {
        _controller.pause();
      }
      _iconAnimationIcon = _isPlaying ? Icons.play_arrow : Icons.pause;
      _iconAnimationShowing = true;
    });

    Future.delayed(const Duration(milliseconds: 700), () {
      if (mounted) {
        setState(() {
          _iconAnimationShowing = false;
        });
      }
    });
  }

  void onVolume() {
    mainController.changeVolume();
    if (!mounted) return;

    setState(() {
      mainController.withVolume
          ? _controller.setVolume(100)
          : _controller.setVolume(0);
      _iconAnimationIcon =
          mainController.withVolume ? Icons.volume_up : Icons.volume_off;
      _iconAnimationShowing = true;
    });

    Future.delayed(const Duration(milliseconds: 700), () {
      if (mounted) {
        setState(() {
          _iconAnimationShowing = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 480;
    bool showExpandedVideo = screenWidth < 640;
    bool showButtonsOutside = screenWidth < 840;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (showExpandedVideo)
          Expanded(
            child: Container(
              color: Colors.black,
              child: Center(
                child: videoContent(showButtonsOutside),
              ),
            ),
          )
        else
          AspectRatio(
            aspectRatio: 9 / 16,
            child: videoContent(showButtonsOutside),
          ),
        if (!showButtonsOutside)
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: VideoButtons(videoPostModel: widget.videoPostModel),
          )
      ],
    );
  }

  Widget videoContent(bool showButtonsOutside) {
    return Container(
      color: Colors.black,
      child: _controller.value.isInitialized
          ? GestureDetector(
              onTap: onPause,
              onDoubleTap: onVolume,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: FittedBox(
                      fit: BoxFit.cover, // Aquí aplicas el efecto cover
                      child: SizedBox(
                        width: _controller.value.size.width,
                        height: _controller.value.size.height,
                        child: VideoPlayer(_controller),
                      ),
                    ),
                  ),
                  SafeArea(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        if (showButtonsOutside)
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 16),
                              child: VideoButtons(
                                buttonInsideVideo: true,
                                videoPostModel: widget.videoPostModel,
                              ),
                            ),
                          )
                        else
                          Spacer(),
                        VideoLabel(videoPostModel: widget.videoPostModel),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            thumbShape: SliderComponentShape.noThumb,
                            trackHeight: 2.0,
                            activeTrackColor: Colors.white,
                            inactiveTrackColor: Colors.black.withOpacity(0.3),
                            overlayShape: SliderComponentShape.noOverlay,
                          ),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 14),
                            child: Slider(
                              value: _currentSliderValue,
                              min: 0.0,
                              max: _controller.value.duration.inSeconds
                                  .toDouble(),
                              onChanged: (value) {
                                if (mounted) {
                                  setState(() {
                                    _currentSliderValue = value;
                                    _controller.seekTo(
                                        Duration(seconds: value.toInt()));
                                  });
                                }
                              },
                            ),
                          ),
                        ),
                        if (widget.bottomSpace) const SizedBox(height: 16),
                      ],
                    ),
                  ),
                  Center(
                    child: AnimatedOpacity(
                      opacity: _iconAnimationShowing ? 0.4 : 0,
                      duration: const Duration(milliseconds: 500),
                      child: Icon(
                        _iconAnimationIcon,
                        size: 140,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            )
          : SizedBox.expand(
              child: CachedNetworkImage(
                imageUrl: widget.videoPostModel.thumbnail,
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                fit: BoxFit.cover,
              ),
            ),
    );
  }
}
