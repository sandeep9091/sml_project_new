import 'package:flutter/material.dart';

import 'dot_container.dart';

class DotsWave extends StatefulWidget {
  final double size;
  final Color color;

  const DotsWave({
    Key? key,
    required this.size,
    required this.color,
  }) : super(key: key);

  @override
  State<DotsWave> createState() => _DotsWaveState();
}

class _DotsWaveState extends State<DotsWave>
    with SingleTickerProviderStateMixin {
  late AnimationController _offsetController;

  @override
  void initState() {
    super.initState();

    _offsetController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1600),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    final double oddDotHeight = widget.size * 0.4;
    final double evenDotHeight = widget.size * 0.7;

    return Container(
      alignment: Alignment.center,
      width: widget.size,
      height: widget.size,
      child: AnimatedBuilder(
        animation: _offsetController,
        builder: (_, __) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            DotContainer(
              controller: _offsetController,
              offsetInterval: const Interval(0.18, 0.28),
              reverseOffsetInterval: const Interval(0.47, 0.57),
              color: widget.color,
              size: widget.size,
              maxHeight: oddDotHeight,
            ),
            DotContainer(
              controller: _offsetController,
              offsetInterval: const Interval(0.27, 0.37),
              reverseOffsetInterval: const Interval(0.56, 0.66),
              color: widget.color,
              size: widget.size,
              maxHeight: evenDotHeight,
            ),
            DotContainer(
              controller: _offsetController,
              offsetInterval: const Interval(0.36, 0.46),
              reverseOffsetInterval: const Interval(0.65, 0.75),
              color: widget.color,
              size: widget.size,
              maxHeight: oddDotHeight,
            ),
            DotContainer(
              controller: _offsetController,
              offsetInterval: const Interval(0.45, 0.55),
              reverseOffsetInterval: const Interval(0.74, 0.84),
              color: widget.color,
              size: widget.size,
              maxHeight: evenDotHeight,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _offsetController.dispose();
    super.dispose();
  }
}
