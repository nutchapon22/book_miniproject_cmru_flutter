import 'package:flutter/material.dart';

class Like with ChangeNotifier {
  final List<Map<String, dynamic>> _list = [];

  List get test => _list;

  void add(String id, String name, String cover, String path) {
    _list.add({
      'id': id,
      'name': name,
      'cover': cover,
      'path': path,
    });
    notifyListeners();
  }

  void remove(int index) {
    _list.removeAt(index);
    notifyListeners();
  }
}

class book with ChangeNotifier {
  List<Map<String, dynamic>> _Booklist = [
    {
      'id': '1',
      'name': 'สาระวิทย์ ฉบับ ธันวาคม 2566',
      'cover': '1.png',
      'path': 'bookpdf/1.pdf',
      'isfave': false
    },
    {
      'id': '2',
      'name': 'สาระวิทย์ ฉบับ พฤศจิกายน 2566',
      'cover': '2.png',
      'path': 'bookpdf/2.pdf',
      'isfave': false
    },
    {
      'id': '3',
      'name': 'สาระวิทย์ ฉบับ ตุลาคม 2566',
      'cover': '3.png',
      'path': 'bookpdf/3.pdf',
      'isfave': false
    },
  ];

  List get bookList => _Booklist;

  void updateIsfave(String id) {
    int index = _Booklist.indexWhere((element) => element['id'] == id);
    _Booklist[index]['isfave'] = !_Booklist[index]['isfave'];
    notifyListeners();
  }
}

class public_relations with ChangeNotifier {
  List<Map<String, dynamic>> _public_relations = [
    {
      'id': '1',
      'name': 'ประชาสัมพันธ์ ฉบับ ธันวาคม 2566',
      'cover': '1.png',
    },
    {
      'id': '2',
      'name': 'ประชาสัมพันธ์ ฉบับ พฤศจิกายน 2566',
      'cover': '2.png',
    },
    {
      'id': '3',
      'name': 'ประชาสัมพันธ์ ฉบับ ตุลาคม 2566',
      'cover': '3.png',
    },
  ];

  List get public_relationsList => _public_relations;
}
