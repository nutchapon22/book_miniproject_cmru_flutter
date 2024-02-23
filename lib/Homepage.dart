import 'dart:math';

import 'package:book/MyDrawner.dart';
import 'package:book/Read.dart';
import 'package:book/provider.dart';
import 'package:book/recommend.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final bookProvider = Provider.of<book>(context);
    final Booklist = bookProvider.bookList;
    double widthScreen = MediaQuery.of(context).size.width;
    double heightScreen = MediaQuery.of(context).size.height;
    int? itemcount = 2;
    if (widthScreen > 600 && widthScreen < 1500) {
      itemcount = 3;
    } else if (widthScreen > 1500) {
      itemcount = 4;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("หนังสือ"),
      ),
      drawer: const MyDrawner(),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:
                        itemcount, // Adjust the number of columns as needed
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
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  Booklist[index]['cover'],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Row(
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
                                            recommendtext: Booklist[index]
                                                ['recommend'],
                                          ),
                                        ),
                                      );
                                    },
                                    child: const Text("ตัวอย่าง"),
                                  ),
                                  // IconButton(
                                  //     onPressed: () {}, icon: Icon(Icons.book)),
                                  IconButton(
                                    onPressed: () {
                                      if (isfav) {
                                        bookProvider.updateIsfave(
                                            Booklist[index]['id']);
                                        context
                                            .read<Like>()
                                            .removebyId(Booklist[index]['id']);
                                      } else {
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
                                              Booklist[index]['path'],
                                              Booklist[index]['recommend'],
                                            );
                                      }
                                    },
                                    icon: Icon(
                                      isfav
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      color: Colors.deepPurple,
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
