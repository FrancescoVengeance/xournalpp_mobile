import 'package:flutter/cupertino.dart';
import 'package:xournalpp_mobile/models/content.dart';
import 'package:xournalpp_mobile/models/stroke_point.dart';
import 'package:xournalpp_mobile/utils/stroke_tool.dart';

class ContentListener extends StatefulWidget {
  @required
  final Function(Content?) onNewContent;

  const ContentListener({super.key, required this.onNewContent});

  @override
  State<StatefulWidget> createState() => _ContentListenerState();
}

class _ContentListenerState extends State<ContentListener> {

  List<StrokePoint> points = [];

  @override
  Widget build(BuildContext context) {
    return Listener(
      behavior: HitTestBehavior.translucent,
      onPointerMove: (data) {
        double x = data.localPosition.dx;
        double y = data.localPosition.dy;
        double width = data.pressure * 1;
        StrokePoint point = StrokePoint(x: x, y: y, width: width);
        print(point);
        points.add(point);

        setState(() {});
      },
      onPointerUp: (data) {
        saveStroke(StrokeTool.pen);
      },
    );
  }

  void saveStroke(StrokeTool tool) {
    if(points.isNotEmpty) {
      print("SAVING STROKES");
      points.clear();
    }
  }

}