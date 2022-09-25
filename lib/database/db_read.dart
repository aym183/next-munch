import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:developer' as devtools show log;

void get_groups(String email){
  FirebaseFirestore.instance
  .collection('groups')
  .where('members')
  .get()
  .then((querySnapshot) {
      List listData = querySnapshot.docs.map((doc) => doc.data()).toList();
      // .docs.toList().map((item) {
      //   return item.data();
      // }).toList();

      devtools.log("listData: ${listData.toString()}");
    });
}