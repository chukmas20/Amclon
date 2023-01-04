import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobecom/utils/color__themes.dart';
import 'package:mobecom/utils/constants.dart';
import 'package:mobecom/utils/utils.dart';

class AccountScreenAppBar extends StatelessWidget with PreferredSizeWidget{
  @override
  final Size preferredSize;
   AccountScreenAppBar({Key? key})
      :preferredSize = Size.fromHeight(kAppBarHeight),
     super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 60, 0, 0),
      child: Container(
        height: kAppBarHeight,
        width: screenSize.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
           colors: backgroundGradient,
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Image.network(
                  amazonLogoUrl,
                  height: kAppBarHeight * 0.7,
              ),
            ),
            Row(
              children: [
              IconButton(
                  onPressed: (){},
                  icon:Icon(
                  Icons.notifications_outlined,
                  color: Colors.black,
              )),
                IconButton(
                    onPressed: (){},
                    icon:Icon(
                      Icons.search_outlined,
                      color: Colors.black,
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
