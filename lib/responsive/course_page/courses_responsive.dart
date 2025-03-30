import 'package:flutter/material.dart';

class coursePageResponsive extends StatefulWidget {
  const coursePageResponsive({super.key});

  @override
  State<coursePageResponsive> createState() => _coursePageResponsiveState();
}

class _coursePageResponsiveState extends State<coursePageResponsive> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxHeight < 600) {
        return Scaffold();
      } else {
        return Scaffold();
      }
    });
  }
}
