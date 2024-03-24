
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xournalpp_mobile/widgets/main_drawer.dart';

class Notebook extends StatelessWidget {
  final String name;

  const Notebook({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(name)),
      drawer: MainDrawer(),
      body: Center(
        child: Text("Canvas"),
      ),
    );
  }
  
}