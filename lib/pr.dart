import 'package:book/MyDrawner.dart';
import 'package:book/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class Public_relations extends StatefulWidget {
  const Public_relations({super.key});

  @override
  State<Public_relations> createState() => _Public_relationsState();
}

class _Public_relationsState extends State<Public_relations> {
  @override
  Widget build(BuildContext context) {
    var pr = context.watch<public_relations>().public_relationsList;
    return Scaffold(
      appBar: AppBar(
        title: const Text("ประชาสัมพันธ์"),
      ),
      drawer: const MyDrawner(),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            child: Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: pr.length,
                  itemBuilder: ((context, index) {
                    return Center(
                      child: Container(
                        margin: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.deepPurple[50],
                                // image: DecorationImage(
                                //   image: AssetImage(pr[index]['cover']),
                                //   fit: BoxFit.cover,
                                // ),
                              ),
                              width: 900,
                              padding: EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Image.asset(
                                    'assets/${pr[index]['cover']}',
                                    width: 1200,
                                    fit: BoxFit.cover,
                                  ),
                                  FittedBox(
                                    fit: BoxFit.fitWidth,
                                    child: Container(
                                      padding: EdgeInsets.all(2),
                                      child: Text(
                                        '${pr[index]['name']}',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
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
      ),
    );
  }
}
