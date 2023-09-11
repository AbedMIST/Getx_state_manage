import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Second Page"),
      ),
      body: const Center(
        child: Text(
          "Second Page",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
