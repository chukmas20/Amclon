import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobecom/model/product_model.dart';
import 'package:mobecom/utils/color__themes.dart';
import 'package:mobecom/utils/utils.dart';
import 'package:mobecom/widgets/custom_simple_rounded_button.dart';
import 'package:mobecom/widgets/custom_square_button.dart';
import 'package:mobecom/widgets/product_information_widget.dart';


class CartItemWidget extends StatelessWidget {
   final ProductModel product;
  const CartItemWidget({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    return Container(
        padding: EdgeInsets.all(25),
        height: screenSize.height / 2,
        width: screenSize.width,
       decoration: BoxDecoration(
         color: backgroundColor,
         border: Border(
               bottom: BorderSide(
                   color: Colors.grey, width: 1
               ),
           ),
       ),

      child: Column(
        children: [
          Expanded(
            child: Row(
             mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: screenSize.width / 3,
                  child: Align(
                    alignment: Alignment.topCenter,
                      child: Center(
                        child: Image.network(
                            product.url
                        ),
                      ),
                  ),
                ),
                ProductInformationWidget(
                    productName: product.productName,
                    cost: product.cost,
                    sellerName: product.sellerName,
                ),
              ],
           ),
          ),
          Expanded(
            child: Row(
               children: [
                 CustomSquareButton(
                     child: Icon(Icons.remove),
                     onPressed: (){},
                     color:Colors.grey[500]!,
                     dimension: 40,
                 ),
                 CustomSquareButton(
                   child: Text(
                     "0",
                     style: TextStyle(
                         color: Colors.black,
                     ),
                   ),
                   onPressed: (){},
                   color:Colors.grey[200]!,
                   dimension: 40,
                 ),
                 CustomSquareButton(
                   child: Icon(Icons.add),
                   onPressed: (){},
                   color:Colors.grey[500]!,
                   dimension: 40,
                 ),
               ],
            ),
            // flex:3,
          ),
          // Expanded(
          //   child: Container(
          //     color: Colors.blue,
          //   ),
          //   // flex:1,
          // ),
          Expanded(
              child: Padding(
                 padding: EdgeInsets.only(top: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        CustomSimpleRoundedButton(
                            onPressed:(){},
                            text: "Delete"
                        ),
                         SizedBox(width: 5,),
                        CustomSimpleRoundedButton(
                            onPressed:(){},
                            text: "Save for later"
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("See more like this", style: TextStyle(
                          color: activeCyanColor,
                         ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // flex:1
          ),
        ],
      ),
    );
  }
}
