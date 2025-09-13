// ignore: file_names
import 'package:flutter/material.dart';

class H2CycleLogo extends StatelessWidget {
  final double size;
  const H2CycleLogo({super.key, this.size = 120});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/h2cycle_logo.png', // ton logo converti en PNG
      height: size,
      width: size,
      fit: BoxFit.contain,
    );
  }
}

