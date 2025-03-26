import 'package:dummy_app_empoweshe/responsive/responsive.dart';
import 'package:dummy_app_empoweshe/widgets/course_card.dart';
import 'package:flutter/material.dart';

class desktopBody extends StatefulWidget {
  const desktopBody({super.key});

  @override
  State<desktopBody> createState() => _desktopBodyState();
}

class _desktopBodyState extends State<desktopBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Image.asset(
                'lib/assets/png_icon_color_purple.png',
                width: 80,
              ),
            ),
            Text(
              'text',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Container(
                  alignment: Alignment.center,
                  width: 380,
                  height: 150,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      CourseCard(
                          title: 'STEM',
                          description: 'Learn about STEM fields!'),
                      CourseCard(
                          title: 'How To', description: 'Guides and Tutorials'),
                      CourseCard(
                          title: 'Advances', description: 'Latest Innovations'),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                print('Learn more button pressed');
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ResponsivePage()));
              },
              child: const Text(
                'Learn more here!',
                style: TextStyle(color: Colors.pink),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
