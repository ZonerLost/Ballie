import 'dart:ui';
import 'package:ballie/constants/app_colors.dart';
import 'package:ballie/constants/app_fonts.dart';
import 'package:ballie/constants/app_images.dart';
import 'package:ballie/constants/app_sizes.dart';
import 'package:ballie/view/widget/blur_container_widget.dart';
import 'package:ballie/view/widget/common_image_view_widget.dart';
import 'package:ballie/view/widget/custom_app_bar_widget.dart';
import 'package:ballie/view/widget/custom_container_widget.dart';
import 'package:ballie/view/widget/match_score_row_widget.dart';
import 'package:ballie/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class WMatchStreaming extends StatelessWidget {
  const WMatchStreaming({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: simpleAppBar(title: 'Match Screening'),
        body: _VideoPlayerWidget(),
      ),
    );
  }
}

class _VideoPlayerWidget extends StatefulWidget {
  @override
  State<_VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<_VideoPlayerWidget> {
  late VideoPlayerController _controller;
  bool _initialized = false;

  @override
  void initState() {
    super.initState();
    _controller =
        VideoPlayerController.network(
            'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
          )
          ..initialize().then((_) {
            setState(() {
              _initialized = true;
            });
          });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: AppSizes.VERTICAL,
      physics: BouncingScrollPhysics(),
      children: [
        SizedBox(
          height: 220,
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: _initialized
                ? Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _controller.pause();
                          });
                        },
                        child: VideoPlayer(_controller),
                      ),
                      VideoProgressIndicator(_controller, allowScrubbing: true),
                      if (!_controller.value.isPlaying)
                        Align(
                          alignment: Alignment.center,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _controller.play();
                              });
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: BackdropFilter(
                                filter: ImageFilter.blur(
                                  sigmaX: 50,
                                  sigmaY: 50,
                                ),
                                child: Container(
                                  width: 48,
                                  height: 48,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: kTertiaryColor.withValues(
                                      alpha: 0.2,
                                    ),
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.play_arrow,
                                      color: kSecondaryColor,
                                      size: 32,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  )
                : Container(
                    color: Colors.black,
                    child: Center(child: CircularProgressIndicator()),
                  ),
          ),
        ),

        Padding(
          padding: AppSizes.DEFAULT,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              BlurContainer(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CommonImageView(
                        height: 48,
                        width: 48,
                        radius: 100,
                        imagePath: Assets.imagesCl,
                      ),
                      MyText(
                        paddingTop: 10,
                        text: 'UEFA Champions League',
                        size: 14,
                        textAlign: TextAlign.center,
                        weight: FontWeight.w600,
                        paddingBottom: 30,
                      ),
                      MatchScoreRow(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
