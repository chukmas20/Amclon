import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobecom/model/user_detail_model.dart';
import 'package:mobecom/utils/color__themes.dart';
import 'package:mobecom/utils/constants.dart';
import 'package:mobecom/utils/utils.dart';

class UserDetailsBar extends StatelessWidget {
  final double offset;
  final UserDetailsModel userDetails;
  const UserDetailsBar({
    Key? key,
    required this.offset,
    required this.userDetails
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    return Positioned(
      top: -offset / 3,
      child: Container(
         height: kAppBarHeight,
         width: screenSize.width,
         decoration: BoxDecoration(
             gradient: LinearGradient(
                 colors:lightBackgroundaGradient,
                 begin:  Alignment.centerLeft,
                 end: Alignment.centerRight,
              ),
          ),
         child: Padding(
           padding: EdgeInsets.symmetric(
               vertical: 3, horizontal: 20
           ),
             child: Row(
               children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Icon(
                      Icons.location_on_outlined,
                      color:Colors.grey[900],
                    ),
                  ),
                 SizedBox(
                   width: screenSize.width * 0.7,
                   child: Text(
                     "Deliver to ${userDetails.name} @ ${userDetails.address}",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.grey[900],
                      ),
                   ),
                 ),
               ],
             ),
         ),
      ),
    );
  }
}
