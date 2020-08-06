import 'package:flutter/material.dart';

class ZoomableWidget extends StatefulWidget {
  @required
  final Widget child;
  @required
  final TransformationController controller;
  @required
  final GestureScaleUpdateCallback onInteractionUpdate;

  const ZoomableWidget(
      {Key key, this.child, this.controller, this.onInteractionUpdate})
      : super(key: key);

  @override
  ZoomableWidgetState createState() => ZoomableWidgetState();
}

class ZoomableWidgetState extends State<ZoomableWidget> {
  bool enabled = false;

  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
      boundaryMargin: const EdgeInsets.all(16),
      onInteractionUpdate: widget.onInteractionUpdate,
      panEnabled: enabled,
      scaleEnabled: enabled,
      transformationController: widget.controller,
      minScale: 0.1,
      maxScale: 5,
      child: widget.child,
    );
  }
}
