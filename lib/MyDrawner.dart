import 'package:book/Homepage.dart';
import 'package:book/favorite_book.dart';
import 'package:book/pr.dart';
import 'package:flutter/material.dart';

class MyDrawner extends StatelessWidget {
  const MyDrawner({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          DrawerHeader(
            child: Column(
              children: [
                Image.asset(
                  'assets/lo.png',
                  width: 100,
                ),
                Text("Boring Science Magazine",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.book),
            title: Text(
              "หนังสือ",
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.mic),
            title: Text(
              "ประชาสัมพันธ์",
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Public_relations(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text(
              "รายการโปรด",
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const favorite_book(
                    title: 'รายการโปรด',
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
