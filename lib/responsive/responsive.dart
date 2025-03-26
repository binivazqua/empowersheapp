import 'package:flutter/material.dart';

class ResponsivePage extends StatefulWidget {
  const ResponsivePage({super.key});

  @override
  State<ResponsivePage> createState() => _ResponsivePageState();
}

Color byWidth(double width) {
  if (width < 600) {
    return Colors.blue;
  } else if (width < 860) {
    return Colors.purple;
  } else {
    return Colors.cyanAccent;
  }
}

class _ResponsivePageState extends State<ResponsivePage> {
  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: byWidth(currentWidth),
      body: Center(
        child: Text(currentWidth.toString()),
      ),
    );
  }
}
