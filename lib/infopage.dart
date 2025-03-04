import 'package:dummy_app_empoweshe/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class infoPage extends StatefulWidget {
  const infoPage({super.key});

  @override
  State<infoPage> createState() => _infoPageState();
}

class _infoPageState extends State<infoPage> {
  //reference database:
  final _mybox = Hive.box('mybox');

  // create methods:
  void writeData() {
    _mybox.put(1, 'Binini');
  }

  void readData() {
    print(_mybox.get(1));
  }

  void deleteData() {
    _mybox.delete(1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: sky,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          spacing: 5,
          children: [
            Text('Probando bases de datos!'),
            ElevatedButton(onPressed: writeData, child: Text('Add Data')),
            ElevatedButton(onPressed: () {}, child: Text('Read Data')),
            ElevatedButton(onPressed: () {}, child: Text('Delete Data'))
          ],
        ),
      ),
    );
  }
}
