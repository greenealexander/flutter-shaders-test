// Copyright 2023 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../assets.dart';
import '../common/reactive_widget.dart';
import 'radar_shader_config.dart';
import 'radar_shader_painter.dart';

class RadarShaderWidget extends StatefulWidget {
  const RadarShaderWidget({
    super.key,
    required this.config,
  });

  final RadarShaderConfig config;

  @override
  State<RadarShaderWidget> createState() => RadarShaderWidgetState();
}

class RadarShaderWidgetState extends State<RadarShaderWidget>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) => Consumer<FragmentPrograms?>(
        builder: (context, fragmentPrograms, _) {
          if (fragmentPrograms == null) return const SizedBox.expand();

          return ReactiveWidget(
            builder: (context, time, size) {
              return CustomPaint(
                size: size,
                painter: RadarShaderPainter(
                  fragmentPrograms.radar.fragmentShader(),
                  config: widget.config,
                  time: time,
                ),
              );
            },
          );
        },
      );
}
