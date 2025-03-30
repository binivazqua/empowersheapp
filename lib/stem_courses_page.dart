import 'package:flutter/material.dart';

class Courses extends StatelessWidget {
  const Courses({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 115, 137, 175),
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, right: 10, left: 10),
                child: SearchBar(
                  backgroundColor: WidgetStatePropertyAll(Colors.white70),
                  leading: Icon(
                    Icons.search,
                    color: Colors.blueAccent,
                  ),
                  shadowColor: WidgetStatePropertyAll(Colors.black),
                  hintText: 'Search',
                ),
              ),
              SingleChildScrollView(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10, left: 10),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text("New Courses",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ),
                    SizedBox(
                      height: 300,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [courseCard(), courseCard(), courseCard()],
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(" Seguir Aprendiendo",
                        style: TextStyle(fontSize: 18, color: Colors.white)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, bottom: 10),
                child: Container(
                  width: 150,
                  margin: EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Ciencia",
                            style:
                                TextStyle(fontSize: 18, color: Colors.white70)),
                        SizedBox(height: 5),
                        Text("13 courses",
                            style:
                                TextStyle(fontSize: 14, color: Colors.white70)),
                        SizedBox(height: 5),
                        LinearProgressIndicator(
                          value: 0.72,
                          backgroundColor: Colors.grey,
                          color: Colors.yellow,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20.0, left: 20),
                child: Card(
                  color: Colors.grey[900],
                  margin: EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: ListTile(
                    leading: Icon(Icons.web, color: Colors.orange, size: 40),
                    title: Text("Matematicas",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w300)),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("7 courses",
                            style: TextStyle(color: Colors.white70)),
                        SizedBox(height: 5),
                        LinearProgressIndicator(
                          value: 0.58,
                          backgroundColor: Colors.grey,
                          color: Colors.orange,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20.0, left: 20.0),
                child: Card(
                  color: Colors.grey[900],
                  margin: EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: const ListTile(
                    leading: Icon(Icons.web, color: Colors.orange, size: 40),
                    title: Text("Tecnología",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w300)),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("10 cursos",
                            style: TextStyle(color: Colors.white70)),
                        SizedBox(height: 5),
                        LinearProgressIndicator(
                          value: 0.57,
                          backgroundColor: Colors.grey,
                          color: Colors.orange,
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget courseCard() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 180,
        width: 180,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 119, 48, 163),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Biology Course\n Level 1\n Duration: 1hr 30min\n Description: Learn human biology and the parts of the cell.',
                style: TextStyle(color: Colors.white, fontSize: 12),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              const Icon(
                Icons.science,
                color: Color.fromARGB(255, 231, 243, 250),
                size: 40,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.deepPurple,
                ),
                child: const Text('Sign Up!'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
