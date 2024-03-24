import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xournalpp_mobile/utils/editing_tool.dart';

class ToolBar extends StatefulWidget {
  const ToolBar({super.key});

  @override
  State<StatefulWidget> createState() => _ToolBarState();
}

class _ToolBarState extends State<ToolBar> {
  EditingTool selected = EditingTool.stylus;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      padding: const EdgeInsets.all(8),
      alignment: Alignment.centerLeft,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: [
          toolButton("Stylus", EditingTool.stylus, Icons.edit, onPress: () {}),
          const SizedBox(width: 5,),
          toolButton("Eraser", EditingTool.eraser, Icons.backspace, onPress: () {}),
          const SizedBox(width: 5,),
          toolButton("Highlight", EditingTool.highlight, Icons.brush, onPress: () {}),
          const SizedBox(width: 5,),
          toolButton("Move", EditingTool.move, Icons.pan_tool, onPress: () {}),
          const SizedBox(width: 5,),
          toolButton("Text", EditingTool.text, Icons.keyboard, onPress: () {}),
          const SizedBox(width: 5,),
          toolButton("LateX", EditingTool.latex, Icons.science, onPress: () {}),
        ],
      ),
    );
  }

  Widget toolButton(String tip, EditingTool heroTag, IconData icon, {required void Function() onPress}) {
    return FloatingActionButton(
        tooltip: tip,
        elevation: 0,
        heroTag: heroTag,
        backgroundColor: selected == heroTag ? Colors.deepPurpleAccent : Theme.of(context).unselectedWidgetColor,
        child: Icon(icon, color: Colors.white),
        onPressed: () {
          setState(() => selected = heroTag);
          onPress();
        }
    );
    }
}