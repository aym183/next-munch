import 'package:cloud_firestore/cloud_firestore.dart';

void Preferences_UpdateDB(String email, String cuisines, String restaurants, int ?budget, int ?distance, String dietary){
  final users = FirebaseFirestore.instance.collection('users').doc(email);
  users.update({
      "cuisines": cuisines,
      'restaurants': restaurants,
      'budget': budget,
      'distance': distance,
      'dietary': dietary,  
      "login_index": 1   
});
}


void add_group_to_userDB(String email, String group_name){
  final users = FirebaseFirestore.instance.collection('users').doc(email);
  users.update({
      "groups":  [group_name],
});
}


  // users.doc(email.toString()).set({'name': name.toString(),'login_index': 0});
  // users.add({'name': name.toString(),'email': email.toString(), 'login_index': 0})