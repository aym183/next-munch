import 'package:cloud_firestore/cloud_firestore.dart';

void Insert_user_intoDB(String name, String email){
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  users.doc(email.toString()).set({'username': name.toString(),'login_index': 0});
  // users.add({'name': name.toString(),'email': email.toString(), 'login_index': 0});
}

void Insert_group_intoDB(String group_name, String username){
  CollectionReference groups = FirebaseFirestore.instance.collection('groups');
  groups.add({'group_name': group_name.toString(), "created_by":  username, "creation_time": Timestamp.now(),});
  // users.add({'name': name.toString(),'email': email.toString(), 'login_index': 0});
}