import 'package:cloud_firestore/cloud_firestore.dart';

void Insert_user_intoDB(String name, String email){
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  users.doc(email.toString()).set({'username': name.toString(),'login_index': 0, 'email': email.toString()});
  // users.add({'name': name.toString(),'email': email.toString(), 'login_index': 0});
}

Future<void> Insert_group_intoDB(String group_name, String username, String email) async {
  CollectionReference groups = FirebaseFirestore.instance.collection('groups');
  groups.add({
    'group_name': group_name.toString(), 
    "created_by":  username.toString(), 
    "creation_time": Timestamp.now().toString(),
    "members": [email]
    
    });
    
  // users.add({'name': name.toString(),'email': email.toString(), 'login_index': 0});
}