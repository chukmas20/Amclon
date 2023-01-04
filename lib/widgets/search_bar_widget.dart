import 'package:flutter/material.dart';
import 'package:mobecom/screens/search_screen.dart';
import 'package:mobecom/utils/color__themes.dart';
import 'package:mobecom/utils/constants.dart';
import 'package:mobecom/utils/utils.dart';

class SearchBarWidget extends StatelessWidget with PreferredSizeWidget {
   final bool isReadOnly;
   final bool hasBackButton;
   SearchBarWidget({Key? key, required this.isReadOnly, required this.hasBackButton}) :
        preferredSize = const Size.fromHeight(kAppBarHeight),
        super(key: key);

  @override
  final Size preferredSize;

  OutlineInputBorder border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(7),
    borderSide: BorderSide(color: Colors.grey, width: 1),
  );

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 60, 0, 0),
      child: Container(
         decoration: const BoxDecoration(
             gradient: LinearGradient(
               colors: backgroundGradient,
               begin: Alignment.centerLeft,
               end: Alignment.centerRight
             ),
         ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            hasBackButton? IconButton(
                onPressed:(){
                   Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back)
            ):Container(),
            SizedBox(
                width: screenSize.width * 0.7,
                child: Container(
                  decoration: BoxDecoration(
                      boxShadow: [BoxShadow(color:Colors.black.withOpacity(0.2),
                        blurRadius: 8,
                        spreadRadius: 1,
                        offset: Offset(0,5),
                      ),
                      ],
                  ),
                  child: TextField(
                    readOnly: isReadOnly,
                    onTap: (){
                       if(isReadOnly){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context)=> const SearchScreen(),
                              ),
                          );
                       }
                    },
                    decoration:InputDecoration(
                      hintText: "Search ...",
                      fillColor: Colors.white,
                      filled: true,
                      border: border,
                      focusedBorder: border,
                    ),
                  ),
                ),
            ),
            IconButton(onPressed:(){}, icon: Icon(Icons.mic_outlined)),
          ],
        ),
      ),
    );
  }
}