import 'package:dummy_app_empoweshe/constants/colors.dart';
import 'package:dummy_app_empoweshe/course_detail_page.dart';
import 'package:dummy_app_empoweshe/infopage.dart';
import 'package:dummy_app_empoweshe/responsive/desktopBody.dart';
import 'package:dummy_app_empoweshe/responsive/mobileBody.dart';
import 'package:dummy_app_empoweshe/responsive/responsive.dart';
import 'package:dummy_app_empoweshe/responsive/responsive_layout.dart';
import 'package:dummy_app_empoweshe/responsive/videoplayer_page.dart';
import 'package:dummy_app_empoweshe/stem_courses_page.dart';
import 'package:dummy_app_empoweshe/widgets/course_card.dart';
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
        home: const MyHomePage(title: 'Flutter Demo Home Page'));
    //ResponsivePage());
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
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => VideoPlayerTestPage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('STEM COURSES'),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Courses()));
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
      body: ResponsiveLayout(
          mobileBody: Mobilebody(), desktopBody: desktopBody()),
    );
  }
}
