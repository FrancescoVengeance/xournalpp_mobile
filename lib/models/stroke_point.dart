import 'dart:ui';

class StrokePoint {
  final double? x;
  final double? y;
  final double? width;

  const StrokePoint({this.x, this.y, this.width});

  Offset get offset => Offset(x!, y!);

  @override
  String toString() {
    return "Stroke(x: $x, y: $y, w: $width)";
  }
}