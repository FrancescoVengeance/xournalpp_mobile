import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:xournalpp_mobile/pages/OpenPage.dart';


class MainDrawer extends StatefulWidget {
  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text("Drawer Header")
          ),
          drawerItem("Home", action: () => {}),
          drawerItem("New Notebook", action: () => {}),
          drawerItem("Open", action: () async {
            FilePickerResult? res = await FilePicker.platform.pickFiles();
            if(res != null) {
              File f = File(res.files.single.path!);
              print(f.path);
            }
          }),
        ],
      ),
    );
  }

  Widget drawerItem(String text, {required void Function() action}) {
    return ListTile(
      title: Text(text),
      onTap: () => {
        action(),
        Navigator.pop(context)
      },
    );
  }
}
