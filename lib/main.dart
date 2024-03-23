import 'package:flutter/material.dart';

import 'pages/OpenPage.dart';

void main() {
  runApp(const XournalppMobile());
}

class XournalppMobile extends StatelessWidget {
  const XournalppMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      // localizationsDelegates: ,
      title: 'Flutter Demo',
      theme: ThemeData(
        typography: Typography.material2021(),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const OpenPage(),
    );
  }
}