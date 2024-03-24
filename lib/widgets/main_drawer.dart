import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:xournalpp_mobile/pages/notebook.dart';


class MainDrawer extends StatefulWidget {
  const MainDrawer({super.key});

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
          ListTile(
            title: const Text("Home"),
            onTap: () {},
          ),
          ListTile(
            title: const Text("New Notebook"),
            onTap: () => openDialog(),
          ),
          ListTile(
            title: const Text("Open"),
            onTap: () async {
              FilePickerResult? res = await FilePicker.platform.pickFiles();
              if(res != null) {
                File f = File(res.files.single.path!);
                print(f.path);
              }
            },
          ),
        ],
      ),
    );
  }

  void openDialog() {
    final controller = TextEditingController();
    final formKey = GlobalKey<FormState>();
    showDialog(context: context, builder: (BuildContext context) =>
         Dialog(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
                maxWidth: 600,
                maxHeight: 600,
                minHeight: 300
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Notebook name"),
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (value) {
                            if(value == null || value.isEmpty) {
                              return "Please Enter some text";
                            }
                            return null;
                          },
                          controller: controller,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Enter new notebook's name",
                            constraints: BoxConstraints(
                              maxHeight: 600,
                              maxWidth: 600
                            )
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(child: const Text("Cancel"),
                              onPressed: () => Navigator.pop(context),
                            ),
                            ElevatedButton(child: const Text("Ok"),
                                onPressed: () {
                                  if(formKey.currentState!.validate()) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) =>
                                            Notebook(name: controller.text))
                                    );
                                  }
                                }
                            ),
                          ]
                        )
                      ],
                    )
                  ), // Form(child: child)
                ],
              ),
            ),
          ),
        )
    );
  }
}
