
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xournalpp_mobile/widgets/main_drawer.dart';

import '../widgets/toolbar.dart';

class CanvasPage extends StatelessWidget {
  final String name;

  const CanvasPage({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(64),
          child: ToolBar(),

        ),
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Text("Canvas"),
      ),
    );
  }
  
}