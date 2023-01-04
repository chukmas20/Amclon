import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobecom/model/user_detail_model.dart';

class CloudFireStoreClass{
   FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
   FirebaseAuth firebaseAuth = FirebaseAuth.instance;

   Future uploadNameAndAddressToDataBase({
  required UserDetailsModel  user
   }) async{
       await firebaseFirestore.collection("users")
            .doc(firebaseAuth.currentUser!.uid)
            .set(user.getJson());
     }
}