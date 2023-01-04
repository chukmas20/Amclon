import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobecom/resources/authentication_method.dart';
import 'package:mobecom/screens/sign_in_screen.dart';
import 'package:mobecom/utils/constants.dart';
import 'package:mobecom/utils/utils.dart';
import 'package:mobecom/widgets/custom_main_button.dart';
import 'package:mobecom/widgets/text_field_widget.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  AuthenticationMethods authMethods = AuthenticationMethods();
  bool isLoading = false;

  @override
  void dispose(){
    super.dispose();
    nameController.dispose();
    addressController.dispose();
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
                  SizedBox(
                    height: screenSize.height * 0.7,
                    child: FittedBox(
                      child: Container(
                          height: screenSize.height * 0.7,
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
                              Text("Sign Up", style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w500,
                              ),
                              ),
                              TextFieldWidget(
                                title:"Name",
                                controller:nameController,
                                obscureText:false ,
                                hintText: "Enter Your name",
                              ),
                              TextFieldWidget(
                                title:"address",
                                controller:addressController,
                                obscureText:false ,
                                hintText: "Enter Your address",
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
                                    "Sign Up",
                                    style: TextStyle(letterSpacing: 0.6),
                                  ),
                                  color: Colors.orange,
                                  isLoading: isLoading,
                                  onPressed: () async{
                                    setState(() {
                                       isLoading = true;
                                    });
                                    String output = await authMethods.signUpUser(
                                        name: nameController.text,
                                        address: addressController.text,
                                        email: emailController.text,
                                        password: passwordController.text,
                                    );
                                    setState(() {
                                      isLoading = false;
                                    });
                                    if(output == "Success"){
                                       Navigator.pushReplacement(
                                           context, MaterialPageRoute(builder: (_)=>SigninScreen()
                                       ),
                                       );
                                    }else{
                                     // print(output);
                                      Utils().showSnackBar(
                                          context: context, content: output
                                      );
                                    }
                                  },
                                ),
                              ),
                            ],
                          )
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 1,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  CustomMainButton(
                    child:Text(
                      "Back",
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
                            return SigninScreen();
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
