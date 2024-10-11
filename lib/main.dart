import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GFGTitle(),
    );
  }
}

class GFGTitle extends StatefulWidget {
  @override
  GFGTitleState createState() => GFGTitleState();
}

class GFGTitleState extends State<GFGTitle> {
  String text = "Press me, pls!";

  void _toggleText() {
    setState(() {
      if (text == "Press me, pls!") {
        text = "List Tile pressed";
      } else {
        text = "Press me, pls!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFF4CAF50),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 3,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: AppBar(
              title: const Text(
                "My List Tile demo",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 7.0, left: 7.0, right: 7.0),
            child: ListTile(
              leading: const Icon(Icons.add, color: Color(0xff2397f3)),
              title: const Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: Text(
                  'GFG Title',
                  style: TextStyle(
                    color: Color(0xff2397f3),
                    fontSize: 22,
                  ),
                ),
              ),
              subtitle: const Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: Text(
                  'This is subtitle',
                  style: TextStyle(
                    color: Color(0xff2397f3),
                    fontSize: 12,
                  ),
                ),
              ),
              trailing: const Icon(Icons.check, color: Color(0xff2397f3)),
              tileColor: const Color(0xFFBBDEFB),
              onTap: _toggleText,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              text,
              style: const TextStyle(fontSize: 24),
            ),
          ),
        ],
      ),
    );
  }
}