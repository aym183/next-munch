import 'package:cloud_firestore/cloud_firestore.dart';

void Insert_user_intoDB(String name, String email){
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  users.doc(email.toString()).set({'name': name.toString(),'login_index': 0});
  // users.add({'name': name.toString(),'email': email.toString(), 'login_index': 0});
}