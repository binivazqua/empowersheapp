import 'package:dummy_app_empoweshe/constants/colors.dart';
import 'package:dummy_app_empoweshe/infopage.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  //initialize hive
  await Hive.initFlutter();

  // open box
  var box = await Hive.openBox('mybox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String text = 'Bienvenidas a EmpowerShe';

  void _changeText() {
    setState(() {
      text = 'Enjoy your journey';
    });
    print('Text changed');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Color.fromARGB(255, 231, 243, 250),
        child: ListView(
          children: [
            DrawerHeader(child: Text('O P C I O N E S')),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('About Us'),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => infoPage()));
              },
            )
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: flamingo,
        title: const Text('EmpowerShe App'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings),
            color: Colors.white,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.person),
            color: Colors.white,
          ),
        ],
      ),
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
              text,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 25),
                child: SizedBox(
                  height: 110,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _buildCourseCard(
                          context, 'STEM', 'Learn about STEM fields!'),
                      _buildCourseCard(
                          context, 'How To', 'Guides and Tutorials'),
                      _buildCourseCard(
                          context, 'Advances', 'Latest Innovations'),
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
              },
              child: const Text(
                'Learn more here!',
                style: TextStyle(color: Colors.pink),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _changeText,
        backgroundColor: const Color.fromARGB(255, 220, 134, 231),
        child: const Icon(Icons.favorite, color: Colors.white),
      ),
    );
  }

  Widget _buildCourseCard(
      BuildContext context, String title, String description) {
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

// New page that opens when a course is clicked
class CourseDetailPage extends StatelessWidget {
  final String courseTitle;
  final String description;

  const CourseDetailPage(
      {super.key, required this.courseTitle, required this.description});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text(courseTitle),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                courseTitle,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Text(
                description,
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Go back to home
                },
                child: const Text('Go Back'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
