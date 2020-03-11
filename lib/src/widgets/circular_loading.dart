import 'package:flutter/material.dart';

class CircularLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(Colors.amber),
      backgroundColor: Colors.black,
      strokeWidth: 2.5,
    );
  }
}
