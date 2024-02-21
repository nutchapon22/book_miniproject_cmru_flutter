import 'package:book/Read.dart';
import 'package:flutter/material.dart';

class recommend extends StatefulWidget {
  const recommend({
    super.key,
    required this.title,
    required this.cover,
    required this.path,
    required this.recommendtext,
  });

  final cover;
  final title;
  final path;
  final recommendtext;
  @override
  State<recommend> createState() => _recommendState();
}

class _recommendState extends State<recommend> {
  @override
  Widget build(BuildContext context) {
    List test = ['asd', 'dsa', 'adsq'];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        // backgroundColor: Colors.deepPurple[200],
      ),
      backgroundColor: Colors.deepPurple[100],
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            margin: const EdgeInsets.all(10),
            child: Column(
              children: [
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.deepPurple[50],
                    ),
                    width: 900,
                    height: 500,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: Image.asset(
                        widget.cover,
                        width: 50,
                      ),
                    )),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.deepPurple[50],
                  ),
                  width: 900,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Text(widget.recommendtext),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Reader(
                          title: widget.title,
                          path: widget.path,
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple[50]),
                  child: const Text("read"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
