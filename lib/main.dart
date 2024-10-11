import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(top: 15.0, bottom: 1.0),
          child: Text(
            'Flutter Demo Home Page',
            style: TextStyle(
              color: Color(0xff2b2830),
              fontSize: 16,
            ),
          ),
        ),
        backgroundColor: const Color(0xffd3bbff),
      ),
      body: Container(
        color: const Color(0xfffffbff),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  // do something
                },
                icon: const Icon(
                  Icons.download,
                  color: Color(0xff9a9a9a),
                ),
                label: const Text(
                  "Download",
                  style: TextStyle(
                    color: Color(0xff825bc8),
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xfff7f1fb),
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                ),
              ),
              const SizedBox(height: 5),
              Image.network(
                'https://images.pexels.com/photos/5905557/pexels-photo-5905557.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                width: 300,
                height: 200,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
