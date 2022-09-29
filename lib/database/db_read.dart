import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:developer' as devtools show log;

import 'package:shared_preferences/shared_preferences.dart';

import '../constants/global_values.dart';
import 'db_create.dart';

Future<void> get_groups(String email) async {
  FirebaseFirestore.instance
  .collection('groups')
  .where('members', arrayContains: email) // change as only factoring in one user
  .get()
  .then((querySnapshot) async {
      List<String> listData = querySnapshot.docs.map((doc) => doc.data()['group_name'] as String).toList();

      
      final prefs = await SharedPreferences.getInstance();
      prefs.setStringList('groups', listData);
      global_groups = prefs.getStringList('groups')!;
      // .docs.toList().map((item) {
      //   return item.data();
      // }).toList();
      
    });
}

Future<void> get_username(String email) async {
  FirebaseFirestore.instance
  .collection('users')
  .where('email', isEqualTo: email)
  .get()
  .then((querySnapshot) async {
      List listData = querySnapshot.docs.map((doc) => doc.data()['username']).toList();
      devtools.log(listData[1].toString());
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('username', listData[1].toString());      
    });
}


Future<void> get_invite_code(String group_name) async {
  FirebaseFirestore.instance
  .collection('groups')
  .where('group_name', isEqualTo: group_name) // change as only factoring in one user
  .get()
  .then((querySnapshot) async {
      List<String> listData = querySnapshot.docs.map((doc) => doc.data()['invite_id'] as String).toList();

      final prefs = await SharedPreferences.getInstance();
      devtools.log(listData.toString());
      prefs.setString('invite_id', listData[0].toString());
      // .docs.toList().map((item) {
      //   return item.data();
      // }).toList();
      
    });
}

Future<void> invite_code_check(String group_code) async {
  var data = FirebaseFirestore.instance
  .collection('groups')
  .where('invite_id', isEqualTo: group_code) // change as only factoring in one user
  .get()
  .then((querySnapshot) async {
      
      if (querySnapshot.docs.toString() == "[]"){
         devtools.log("Invalid ID");
      }
      else{
        List<Map<String, dynamic>> listData = querySnapshot.docs.map((doc) => doc.data()).toList();

        final prefs = await SharedPreferences.getInstance();
        Insert_user_intoGroup(prefs.getString('email').toString(), querySnapshot.docs[0].id.toString()); 
        prefs.setString('invite_id', listData[0].toString());

      }
  });
  
  
  // .then((querySnapshot) async {
  //     if (querySnapshot.docs.toString() == "[]"){
  //        devtools.log("Invalid ID");
  //     }
  //     else{
  //       List<Map<String, dynamic>> listData = querySnapshot.docs.map((doc) => doc.data()).toList();

  //       final prefs = await SharedPreferences.getInstance();
  //       devtools.log(querySnapshot.docs.toString());
  //       devtools.log(listData.toString());    
  //       prefs.setString('invite_id', listData[0].toString());

  //     }
      
  //   });

   
}