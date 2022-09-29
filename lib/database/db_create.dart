import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nextmunch/views/bottom_nav_routing.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';
import 'dart:developer' as devtools show log;

void Insert_user_intoDB(String name, String email){
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  users.doc(email.toString()).set({'username': name.toString(),'login_index': 0, 'email': email.toString()});
  // users.add({'name': name.toString(),'email': email.toString(), 'login_index': 0});
}

Future<void> Insert_group_intoDB(String group_name, String username, String email) async {
  var uuid = Uuid();
  CollectionReference groups = FirebaseFirestore.instance.collection('groups');
  groups.add({
    'group_name': group_name.toString(), 
    "created_by":  username.toString(), 
    "creation_time": Timestamp.now().toString(),
    "members": [email],
    "invite_id": uuid.v4(),
    });
}

Future<void> Insert_user_intoGroup(String email, String doc_id) async {
  final update_group = FirebaseFirestore.instance
  .collection('groups')
  .doc(doc_id);

  update_group.update({ 
          "members": FieldValue.arrayUnion([email.toString()]),
  });
  devtools.log('MEMBER ADDED SUCCESSFULY!');
  
      // else{
      //   List<String> listData = querySnapshot.docs.map((doc) => doc.data()['invite_id'] as String).toList();


        // final prefs = await SharedPreferences.getInstance();
        // // devtools.log(listData.toString());    
        // prefs.setString('invite_id', listData[0].toString());\

        // update_group.update({
        //   'group_name': group_name.toString(), 
        //   "created_by":  username.toString(), 
        //   "creation_time": Timestamp.now().toString(),
        //   "members": [email],
        //   "invite_id": uuid.v4(),
        // });

      // }
      
    

  
}