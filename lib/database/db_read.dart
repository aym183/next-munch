import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:developer' as devtools show log;

import 'package:shared_preferences/shared_preferences.dart';

Future<void> get_groups(String email) async {
  FirebaseFirestore.instance
  .collection('groups')
  .where('members', isEqualTo: [email])
  .get()
  .then((querySnapshot) async {
      List listData = querySnapshot.docs.map((doc) => doc.data()['group_name']).toList();

      final prefs = await SharedPreferences.getInstance();
      prefs.setString('groups', listData.toString());
      // .docs.toList().map((item) {
      //   return item.data();
      // }).toList();

      
    });
}

void get_username(String email) async {
  FirebaseFirestore.instance
  .collection('users')
  .where('email', isEqualTo: email)
  .get()
  .then((querySnapshot) async {
      List listData = querySnapshot.docs.map((doc) => doc.data()['username']).toList();
      devtools.log(listData[1].toString());

      final prefs = await SharedPreferences.getInstance();
      prefs.setString('username', listData[1].toString());
      // final prefs = await SharedPreferences.getInstance();
      // prefs.setString('groups', listData.toString());
      // .docs.toList().map((item) {
      //   return item.data();
      // }).toList();

      
    });
}