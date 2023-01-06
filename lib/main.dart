

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobecom/layout/screen_layout.dart';
import 'package:mobecom/model/product_model.dart';
import 'package:mobecom/screens/product_screen.dart';
import 'package:mobecom/screens/results_screen.dart';
import 'package:mobecom/screens/sign_in_screen.dart';
import 'package:mobecom/utils/color__themes.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  if(kIsWeb){
    await Firebase.initializeApp(
        options: FirebaseOptions(
        apiKey: "AIzaSyA65dU1n1EqLUE2RB0lZ6c2AzXAeDFOgEI",
        authDomain: "mobecom-906ef.firebaseapp.com",
        projectId: "mobecom-906ef",
        storageBucket: "mobecom-906ef.appspot.com",
        messagingSenderId: "272285717607",
        appId: "1:272285717607:web:4cd46d0e5cb0eca80970c2"
    ));
  }else{
     await Firebase.initializeApp();
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Mobile Ecommerce",
       debugShowCheckedModeBanner: false,
       theme: ThemeData.light().copyWith(
         scaffoldBackgroundColor: backgroundColor,
       ),
       home: StreamBuilder(
           stream: FirebaseAuth.instance.authStateChanges(),
           builder: (context, AsyncSnapshot<User?> user){
             if(user.connectionState == ConnectionState.waiting){
               return Center(
                 child: CircularProgressIndicator(
                   color: Colors.deepOrange,
                 ),
               );
             }else if(user.hasData){
               // return const ScreenLayout();
                // return ResultScreen(query: "ghgkrgkk");
                return ProductScreen(
                    productModel:ProductModel(
                    url: "https://ng.jumia.is/unsafe/fit-in/300x300/filters:fill(white)/product/12/4853821/1.jpg?1950",
                    cost: 160000,
                    discount: 1000,
                    noOfRating: 10,
                    productName: "Samsung Mobile",
                    rating: 5,
                    sellerName: "John Ajaza",
                    sellerUid: "104y3",
                    uid: "205yu"
                ),
                );
             }else{
                return const SigninScreen();
             }
           }
         ),
    );
  }
}
