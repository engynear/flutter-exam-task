import 'package:flutter/material.dart';

class CriteriaScreen extends StatelessWidget {
  const CriteriaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Критерии'),
      ),
      body: const Center(
        child: Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
