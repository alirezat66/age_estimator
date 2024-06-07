import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomSheet: SafeArea(
            child: ElevatedButton(
          onPressed: () {},
          child: const Text('Get Age'),
        )),
        body: const Center(
          child: Text('Home Page'),
        ));
  }
}
