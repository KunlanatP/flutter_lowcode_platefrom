// ignore_for_file: public_member_api_docs, sort_constructors_first
// Copyright 2020 Sarbagya Dhaubanjar. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class OWYoutubePlayerWidget extends StatefulWidget {
  final String url;
  final double? width;
  final double? height;
  final bool mute;
  final bool autoPlay;
  final bool loop;
  final bool enableCaption;
  final bool showControls;
  final bool showFullscreenButton;
  final bool isDesignMode;

  const OWYoutubePlayerWidget({
    Key? key,
    required this.url,
    this.width,
    this.height,
    this.mute = false,
    this.autoPlay = false,
    this.loop = false,
    this.enableCaption = false,
    this.showControls = true,
    this.showFullscreenButton = true,
    this.isDesignMode = false,
  }) : super(key: key);

  @override
  State<OWYoutubePlayerWidget> createState() => _YoutubePlayerWidgetState();
}

class _YoutubePlayerWidgetState extends State<OWYoutubePlayerWidget> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      params: YoutubePlayerParams(
        mute: widget.mute,
        loop: widget.loop,
        enableCaption: widget.enableCaption,
        color: 'red',
        showFullscreenButton: widget.showFullscreenButton,
        showControls: widget.showControls,
      ),
    );

    _controller.setFullScreenListener(
      (isFullScreen) {
        log('${isFullScreen ? 'Entered' : 'Exited'} Fullscreen.');
      },
    );

    _controller.loadVideo(widget.url);
    if (!widget.autoPlay) _controller.stopVideo();
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: YoutubePlayer(controller: _controller),
    );
  }
}
