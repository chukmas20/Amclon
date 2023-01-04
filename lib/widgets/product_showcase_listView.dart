import 'package:flutter/material.dart';
import 'package:mobecom/utils/color__themes.dart';
import 'package:mobecom/utils/utils.dart';


class ProductsShowCaseListView extends StatelessWidget {
  final String title;
  final List<Widget> children;
  const ProductsShowCaseListView({Key? key, required this.title, required this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    double height = screenSize.height / 4;
    double titleHeight = 25;
    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(8),
      height: height,
      width: screenSize.width,
      color: Colors.white,
      child: Column(
        mainAxisSize:  MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: titleHeight,
            child: Row(
                children: [
                  Text(title, style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold
                   ),
                  ),
                  Padding(
                      padding:EdgeInsets.only(left: 14),
                    child:Text(
                      "Show more",
                      style:TextStyle(
                          color: activeCyanColor
                      ),
                    ),
                  ),
                ],
            ),
          ),
          SizedBox(
            height: height -(titleHeight + 26),
            width: screenSize.width,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: children,
            ),
          ),
        ],
      ),
    );
  }
}
