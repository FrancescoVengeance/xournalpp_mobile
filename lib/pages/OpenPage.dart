import 'package:flutter/material.dart';
import 'package:xournalpp_mobile/widgets/MainDrawer.dart';
import 'package:xournalpp_mobile/widgets/Notebook.dart';

class OpenPage extends StatefulWidget {
  const OpenPage({super.key});

  String get title => "Xournal++";

  @override
  State<StatefulWidget> createState() => _OpenPageState();
}

class _OpenPageState extends State<OpenPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(title: Text(widget.title)),
      body: GridView.count(
        crossAxisCount: 4,
        crossAxisSpacing: 20.0,
        mainAxisSpacing: 20.0,
        children: const [
          Notebook(),
          Notebook(),
          Notebook(),
          Notebook(),
          Notebook(),
          Notebook(),
          Notebook(),
          Notebook(),
          Notebook(),
          Notebook(),
          Notebook(),
          Notebook(),
        ],
      ),
    );
  }


}