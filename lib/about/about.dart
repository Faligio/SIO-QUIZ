import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: const Text('A propos'), backgroundColor: Colors.blue),
      body: const Center(
        child: Text('A propos...'),
      ),
    );
  }
}
