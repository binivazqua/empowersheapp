import 'package:dummy_app_empoweshe/course_detail_page.dart';
import 'package:flutter/material.dart';

class CourseCard extends StatelessWidget {
  final String title;
  final String description;
  const CourseCard({super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to CourseDetailPage when tapped
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                CourseDetailPage(courseTitle: title, description: description),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 120,
          width: 100,
          color: Colors.pink.shade300,
          child: Center(
            child: Text(title, style: const TextStyle(color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
