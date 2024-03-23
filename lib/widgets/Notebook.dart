import 'package:flutter/material.dart';

class Notebook extends StatelessWidget {
  const Notebook({super.key});

  @override
  Widget build(BuildContext context) {
    return Card.filled(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.all(5),
          ),
          const Expanded(
            flex: 2,
            child: Image(image: AssetImage("assets/xournalpp-solid.png"),
              fit: BoxFit.fitWidth,
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
              child: const Text("Appunti di statistica")
          )
        ],
      ),
    );
  }

}