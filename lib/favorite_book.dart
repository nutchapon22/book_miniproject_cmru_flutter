import 'package:book/MyDrawner.dart';
import 'package:book/Read.dart';
import 'package:book/provider.dart';
import 'package:book/recommend.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class favorite_book extends StatefulWidget {
  const favorite_book({super.key, required this.title});

  final title;
  @override
  State<favorite_book> createState() => _favorite_bookState();
}

class _favorite_bookState extends State<favorite_book> {
  @override
  Widget build(BuildContext context) {
    var favoriteList = context.watch<Like>().test;
    double widthScreen = MediaQuery.of(context).size.width;
    int? itemcount = 2;
    if (widthScreen > 600 && widthScreen < 1500) {
      itemcount = 3;
    } else if (widthScreen > 1500) {
      itemcount = 4;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        // backgroundColor: Colors.redAccent,
      ),
      drawer: MyDrawner(),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:
                      itemcount, // Adjust the number of columns as needed
                  crossAxisSpacing: 5.0,
                  mainAxisSpacing: 5.0,
                  childAspectRatio: 0.7, // Adjust the aspect ratio as needed
                ),
                itemCount: favoriteList.length,
                itemBuilder: ((context, index) {
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
                                favoriteList[index]['cover'],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.all(8.0),
                          //   child: Text(
                          //     favorite_list[index]['name'],
                          //     style: TextStyle(fontWeight: FontWeight.bold),
                          //   ),
                          // ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Reader(
                                        title: favoriteList[index]['name'],
                                        path: favoriteList[index]['path'],
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
                                        title: favoriteList[index]['name'],
                                        cover: favoriteList[index]['cover'],
                                        path: favoriteList[index]['path'],
                                        recommendtext: favoriteList[index]
                                            ['recommend'],
                                      ),
                                    ),
                                  );
                                },
                                child: const Text("ตัวอย่าง"),
                              ),
                              IconButton(
                                  onPressed: () {
                                    var id = favoriteList[index]['id'];
                                    print(id);
                                    context.read<book>().updateIsfave(id);
                                    context.read<Like>().removebyId(id);
                                  },
                                  icon: Icon(
                                    Icons.delete_sharp,
                                    color: Colors.deepPurple,
                                  ))
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
