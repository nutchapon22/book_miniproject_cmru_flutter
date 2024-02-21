import 'package:flutter/material.dart';

class Like with ChangeNotifier {
  final List<Map<String, dynamic>> _list = [];

  List get test => _list;

  void add(
      String id, String name, String cover, String path, String recommend) {
    _list.add({
      'id': id,
      'name': name,
      'cover': cover,
      'path': path,
      'recommend': recommend,
    });
    notifyListeners();
  }

  // void remove(int index) {
  //   _list.removeAt(index);
  //   notifyListeners();
  // }

  void removebyId(String id) {
    _list.removeWhere((element) => element['id'] == id);
    notifyListeners();
  }
}

class book with ChangeNotifier {
  List<Map<String, dynamic>> _Booklist = [
    {
      'id': '1',
      'name': 'สาระวิทย์ ฉบับ ธันวาคม 2566',
      'cover': 'assets/1.png',
      'path': 'bookpdf/1.pdf',
      'recommend':
          ' “นิตยสารสาระวิทย์” จัดทำขึ้นโดย สำนักงานพัฒนาวิทยาศาสตร์และเทคโนโลยีแห่งชาติ (สวทช.) มีวัตถุประสงค์เพื่อเผยแพร่ข้อมูลข่าวสารความรู้ทางด้านด้านวิทยาศาสตร์และเทคโนโลยีที่เข้าใจง่าย ให้แก่กลุ่มผู้อ่านที่เป็นเยาวชน ครู อาจารย์ และประชาชนทั่วไป เพื่อส่งเสริมการเรียนรู้ของคนไทยในการมุ่งสู่สังคมที่ขับเคลื่อนด้วยฐานความรู้ และนำความรู้ความเชี่ยวชาญทางด้านวิทยาศาสตร์และเทคโนโลยีไปใช้ในการขับเคลื่อนประเทศสามารถติดตามอ่านนิตยสารสาระวิทย์ทุกเดือนได้ฟรี! ไม่มีค่าใช้จ่าย',
      'isfave': false
    },
    {
      'id': '2',
      'name': 'สาระวิทย์ ฉบับ พฤศจิกายน 2566',
      'cover': 'assets/2.png',
      'path': 'bookpdf/2.pdf',
      'recommend':
          ' “นิตยสารสาระวิทย์” จัดทำขึ้นโดย สำนักงานพัฒนาวิทยาศาสตร์และเทคโนโลยีแห่งชาติ (สวทช.) มีวัตถุประสงค์เพื่อเผยแพร่ข้อมูลข่าวสารความรู้ทางด้านด้านวิทยาศาสตร์และเทคโนโลยีที่เข้าใจง่าย ให้แก่กลุ่มผู้อ่านที่เป็นเยาวชน ครู อาจารย์ และประชาชนทั่วไป เพื่อส่งเสริมการเรียนรู้ของคนไทยในการมุ่งสู่สังคมที่ขับเคลื่อนด้วยฐานความรู้ และนำความรู้ความเชี่ยวชาญทางด้านวิทยาศาสตร์และเทคโนโลยีไปใช้ในการขับเคลื่อนประเทศสามารถติดตามอ่านนิตยสารสาระวิทย์ทุกเดือนได้ฟรี! ไม่มีค่าใช้จ่าย',
      'isfave': false
    },
    {
      'id': '3',
      'name': 'สาระวิทย์ ฉบับ ตุลาคม 2566',
      'cover': 'assets/3.png',
      'path': 'bookpdf/3.pdf',
      'recommend':
          ' “นิตยสารสาระวิทย์” จัดทำขึ้นโดย สำนักงานพัฒนาวิทยาศาสตร์และเทคโนโลยีแห่งชาติ (สวทช.) มีวัตถุประสงค์เพื่อเผยแพร่ข้อมูลข่าวสารความรู้ทางด้านด้านวิทยาศาสตร์และเทคโนโลยีที่เข้าใจง่าย ให้แก่กลุ่มผู้อ่านที่เป็นเยาวชน ครู อาจารย์ และประชาชนทั่วไป เพื่อส่งเสริมการเรียนรู้ของคนไทยในการมุ่งสู่สังคมที่ขับเคลื่อนด้วยฐานความรู้ และนำความรู้ความเชี่ยวชาญทางด้านวิทยาศาสตร์และเทคโนโลยีไปใช้ในการขับเคลื่อนประเทศสามารถติดตามอ่านนิตยสารสาระวิทย์ทุกเดือนได้ฟรี! ไม่มีค่าใช้จ่าย',
      'isfave': false
    },
    {
      'id': '4',
      'name': 'สุดยอดทีม',
      'cover': 'assets/4.png',
      'path': 'bookpdf/4.pdf',
      'recommend': 'รายละเอียดของทีมงานคุณภาพสูงทีมนึง',
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
      'name': 'ประชาสัมพันธ์งานหนังสือ',
      'cover': 'pr1.jpg',
    },
    {
      'id': '2',
      'name': 'ประชาสัมพันธ์งานวิทยาศาสตร์และเทคโนโลยี',
      'cover': 'pr2.png',
    }
  ];

  List get public_relationsList => _public_relations;
}
