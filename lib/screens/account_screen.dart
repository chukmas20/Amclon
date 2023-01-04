import 'package:flutter/material.dart';
import 'package:mobecom/utils/color__themes.dart';
import 'package:mobecom/utils/constants.dart';
import 'package:mobecom/utils/utils.dart';
import 'package:mobecom/widgets/account_screen_appbar.dart';
import 'package:mobecom/widgets/custom_main_button.dart';
import 'package:mobecom/widgets/product_showcase_listView.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AccountScreenAppBar(),
      body:SingleChildScrollView(
        child: SizedBox(
          height:  screenSize.height - kAppBarHeight / 2,
          width: screenSize.width,
          child: Column(
            children: [
               IntroductionWidgetAccountScreen(),
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: CustomMainButton(
                     child: Text("Sign In",style: TextStyle(
                       color: Colors.black,
                       fontWeight: FontWeight.bold,
                     ),),
                     color: Colors.orange,
                     isLoading: false,
                     onPressed: (){
                     },
                 ),
               ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomMainButton(
                     child: Text("Sell", style: TextStyle(
                       color: Colors.black,
                       fontWeight: FontWeight.bold,
                     ),),
                     color: Colors.orange,
                     isLoading: false,
                     onPressed: (){
                     },
                 ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Order Requests", style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),),
                ),
              ),
              ProductsShowCaseListView(title: "Your Orders", children: testChildren),
              Expanded(child: ListView.builder(
                  itemCount: 5, itemBuilder:(context, index){
                   return ListTile(title: Text("Order: Black Shoes"),
                     subtitle: Text("Address: Egbeda, Lagos",
                       style: TextStyle(
                           fontWeight: FontWeight.w600,
                       ),
                     ),
                     trailing: IconButton(
                       icon:Icon(Icons.check),
                       onPressed: (){},
                     ),
                   );
                }
              ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class IntroductionWidgetAccountScreen extends StatelessWidget {
  const IntroductionWidgetAccountScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kAppBarHeight / 2,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: backgroundGradient,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Container(
        height: kAppBarHeight / 2,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors:[
              Colors.orange,
              Colors.orange.withOpacity(0.0000001),
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
       child: Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 17),
             child: RichText(
               text: TextSpan(
                   children: [
                     TextSpan(
                         text:"Hello",
                         style: TextStyle(
                             color: Colors.black,
                             fontSize: 27,
                             fontWeight: FontWeight.bold,
                         ),
                     ),
                     TextSpan(
                         text:"  Dan Dizzy",
                         style: TextStyle(
                         color: Colors.black,
                         fontSize: 27,
                         fontWeight: FontWeight.bold,
                       ),
                     ),
                   ],
               ),
             ),
           ),
           Padding(
             padding: const EdgeInsets.only(right: 20),
             child: CircleAvatar(
               backgroundImage: NetworkImage(
                 "https://plus.unsplash.com/premium_photo-1669879859992-5252477fa489?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTl8fGJsYWNrJTIwbW9kZWx8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60"
               ),
             ),
           ),
         ],
       ),
      ),
    );
  }
}
