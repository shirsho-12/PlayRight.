import 'package:flutter/material.dart';

import 'app_ui.dart';

class PlayRightAppBar extends StatelessWidget {
  const PlayRightAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text('PlayRight.', style: PlayRightTextStyle.title),
      floating: true,
      snap: true,
      // expandedHeight: 200.0,
      // flexibleSpace: const FlexibleSpaceBar(
      //   title: Text('PlayRight.'),
      // ),
    );
  }
}

class Background extends StatelessWidget {
  const Background({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
        child: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            PlayRightColors.inactive.withOpacity(0.3),
            PlayRightColors.accent.withOpacity(0.3),
          ],
        ),
      ),
    ));
  }
}

class FooDecoration extends Decoration {
  final EdgeInsets insets;
  final Color color;
  final double blurRadius;
  final bool inner;

  const FooDecoration({
    this.insets = const EdgeInsets.all(12),
    this.color = Colors.grey,
    this.blurRadius = 8,
    this.inner = false,
  });
  @override
  BoxPainter createBoxPainter([void Function()? onChanged]) =>
      _FooBoxPainter(insets, color, blurRadius, inner);
}

class _FooBoxPainter extends BoxPainter {
  final EdgeInsets insets;
  final Color color;
  final double blurRadius;
  final bool inner;

  _FooBoxPainter(this.insets, this.color, this.blurRadius, this.inner);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    var rect = offset & configuration.size!;
    canvas.clipRect(rect);
    var paint = Paint()
      ..color = color
      ..maskFilter = MaskFilter.blur(BlurStyle.outer, blurRadius);

    var path = Path();
    if (inner) {
      path
        ..fillType = PathFillType.evenOdd
        ..addRect(insets.inflateRect(rect))
        ..addRect(rect);
    } else {
      path.addRect(insets.deflateRect(rect));
    }
    canvas.drawPath(path, paint);
  }
}
