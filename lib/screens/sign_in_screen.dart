import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobecom/resources/authentication_method.dart';
import 'package:mobecom/screens/sign_up_screen.dart';
import 'package:mobecom/utils/constants.dart';
import 'package:mobecom/utils/utils.dart';
import 'package:mobecom/widgets/custom_main_button.dart';
import 'package:mobecom/widgets/text_field_widget.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({Key? key}) : super(key: key);

  @override
  _SigninScreenState createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  AuthenticationMethods authMethods  =  AuthenticationMethods();
  bool isLoading = false;

  @override
   void dispose(){
      super.dispose();
      emailController.dispose();
      passwordController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    return Scaffold(
       backgroundColor: Colors.white,
       body: SingleChildScrollView(

         child: SizedBox(
           height: screenSize.height,
             width: screenSize.width,
           child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.network(
                    amazonLogo,
                    height: screenSize.height * 0.10,
                  ),
                      Container(
                        height: screenSize.height * 0.6,
                        width: screenSize.width * 0.8,
                        padding: EdgeInsets.all(25),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 1),
                        ),
                        child: Column(
                           mainAxisSize: MainAxisSize.min,
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Sign In", style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextFieldWidget(
                              title:"Email",
                              controller:emailController,
                              obscureText:false ,
                              hintText: "Enter Your email",
                            ),
                            TextFieldWidget(
                              title:"PassWord",
                              controller:passwordController,
                              obscureText:true ,
                              hintText: "Enter Your password",
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: CustomMainButton(
                                  child: Text(
                                    "Sign In",
                                    style: TextStyle(letterSpacing: 0.6),
                                  ),
                                  color: Colors.orange,
                                  isLoading: isLoading,
                                  onPressed: () async{
                                    setState(() {
                                       isLoading = true;
                                    });
                                   String output = await  authMethods.signInUser(
                                          email: emailController.text,
                                          password: passwordController.text,
                                      );
                                   setState(() {
                                     isLoading = false;
                                   });
                                     if(output == "success"){

                                     }else{
                                        Utils().showSnackBar(
                                            context: context,
                                            content: output,
                                        );
                                     }
                                   },
                                  ),
                            ),
                          ],
                        )
                      ),
                   Row(
                     children: [
                        Expanded(
                          child: Container(
                            height: 1,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          "Don't have an account",
                           style: TextStyle(
                             color: Colors.deepOrange
                           ),
                        ),
                      ],
                   ),
                   CustomMainButton(
                     child:Text(
                         "Create An Account",
                         style: TextStyle(
                           letterSpacing: 0.6,
                           color:Colors.red,
                           fontWeight: FontWeight.bold,
                         ),
                      ) ,
                     color: Colors.grey[400]!,
                     isLoading:false,
                     onPressed: (){
                       Navigator.pushReplacement(context,
                           MaterialPageRoute(builder: (context){
                              return SignupScreen();
                           }));
                       },
                   ),
                ],
               ),
            ),
      ),
         ),
       ),
    );
  }
}
