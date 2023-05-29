// Copyright 2023 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../radar_shader/radar_shader_config.dart';
import '../radar_shader/radar_shader_widget.dart';

class TitleScreen extends StatefulWidget {
  const TitleScreen({super.key});

  @override
  State<TitleScreen> createState() => _TitleScreenState();
}

class _TitleScreenState extends State<TitleScreen>
    with SingleTickerProviderStateMixin {
  final _key = GlobalKey<RadarShaderWidgetState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Stack(
          children: [
            Positioned.fill(
              child: Stack(
                children: [
                  RadarShaderWidget(
                    key: _key,
                    config: const RadarShaderConfig(),
                  ),
                ],
              ),
            ),
          ],
        ).animate().fadeIn(duration: 1.seconds, delay: .3.seconds),
      ),
    );
  }
}
