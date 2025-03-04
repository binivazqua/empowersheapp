import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DummyPage extends StatefulWidget {
  const DummyPage({super.key});

  @override
  State<DummyPage> createState() => _DummyPageState();
}

class _DummyPageState extends State<DummyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          children: [
            Text(
              'Probando fonts!',
              style: GoogleFonts.lato(),
            )
          ],
        ),
      ),
    );
  }
}
