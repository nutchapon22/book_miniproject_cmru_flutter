import 'package:book/MyDrawner.dart';
import 'package:book/Read.dart';
import 'package:book/provider.dart';
import 'package:book/recommend.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // List<Map<String, dynamic>> Booklist = [
  //   {
  //     'name': 'สาระวิทย์ ฉบับ ธันวาคม 2566',
  //     'cover': '1.png',
  //     'path': 'bookpdf/1.pdf',
  //     'isfave': false
  //   },
  //   {
  //     'name': 'สาระวิทย์ ฉบับ พฤศจิกายน 2566',
  //     'cover': '2.png',
  //     'path': 'bookpdf/2.pdf',
  //     'isfave': false
  //   },
  //   {
  //     'name': 'สาระวิทย์ ฉบับ ตุลาคม 2566',
  //     'cover': '3.png',
  //     'path': 'bookpdf/3.pdf',
  //     'isfave': false
  //   },
  // ];

  @override
  Widget build(BuildContext context) {
    var Booklist = context.watch<book>().bookList;
    return Scaffold(
      appBar: AppBar(
        title: const Text("หนังสือ"),
      ),
      drawer: const MyDrawner(),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, // Adjust the number of columns as needed
                  crossAxisSpacing: 5.0,
                  mainAxisSpacing: 5.0,
                  childAspectRatio: 0.7, // Adjust the aspect ratio as needed
                ),
                itemCount: Booklist.length,
                itemBuilder: ((context, index) {
                  bool isfav = Booklist[index]['isfave'];
                  return Container(
                    child: Card(
                      elevation: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Image.asset(
                              Booklist[index]['cover'],
                              fit: BoxFit.cover,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Reader(
                                        title: Booklist[index]['name'],
                                        path: Booklist[index]['path'],
                                      ),
                                    ),
                                  );
                                },
                                child: const Text("อ่าน"),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => recommend(
                                        title: Booklist[index]['name'],
                                        cover: Booklist[index]['cover'],
                                        path: Booklist[index]['path'],
                                      ),
                                    ),
                                  );
                                },
                                child: const Text("ตัวอย่าง"),
                              ),
                              IconButton(
                                onPressed: () {
                                  if (isfav) {
                                    return;
                                  }
                                  setState(
                                    () {
                                      Booklist[index]['isfave'] =
                                          !Booklist[index]['isfave'];
                                    },
                                  );
                                  context.read<Like>().add(
                                      Booklist[index]['id'],
                                      Booklist[index]['name'],
                                      Booklist[index]['cover'],
                                      Booklist[index]['path']);
                                },
                                icon: Icon(
                                  isfav
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: Colors.deepPurple,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
