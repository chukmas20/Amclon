import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobecom/model/user_detail_model.dart';
import 'package:mobecom/resources/cloudFireStore_methods.dart';

class AuthenticationMethods {
   FirebaseAuth firebaseAuth = FirebaseAuth.instance;
   CloudFireStoreClass cloudFireStoreClass = CloudFireStoreClass();
   Future<String> signUpUser({
     required String name,
     required String address,
     required String email,
     required String password,

   }) async {
     name.trim();
     address.trim();
     email.trim();
     password.trim();
     String output = "Something went wrong";
     if(name != "" && address !="" && email !="" && password !=""){
       try{
         await firebaseAuth.createUserWithEmailAndPassword(
             email: email,
             password: password
         );
         UserDetailsModel user = UserDetailsModel(name: name, address: address);
         await cloudFireStoreClass.uploadNameAndAddressToDataBase(
             user: user
         );
         output = "Success";
       }on FirebaseAuthException catch(e){
         output = e.message.toString();
       }
     }else{
        output = "All fields are required";
     }
     return output;
}
   Future<String> signInUser({
     required String email,
     required String password,

   }) async {
     email.trim();
     password.trim();
     String output = "Something went wrong";
     if( email !="" && password !=""){
       try{
         await firebaseAuth.signInWithEmailAndPassword(
             email: email,
             password: password
         );
         output = "Success";
       }on FirebaseAuthException catch(e){
         output = e.message.toString();
       }
     }else{
       output = "All fields are required";
     }
     return output;
   }
}