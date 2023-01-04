import 'package:flutter/material.dart';
import 'package:mobecom/utils/color__themes.dart';
import 'package:mobecom/utils/utils.dart';
import 'package:mobecom/widgets/cost_widget.dart';


class ProductInformationWidget extends StatelessWidget {
  final String productName;
  final double cost;
  final String sellerName;
  const ProductInformationWidget({
    Key? key,
    required this.productName,
    required this.cost,
    required this.sellerName
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSIze = Utils().getScreenSize();
    return SizedBox(
      width: screenSIze.width / 2,
      child:
      Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Align(
             alignment: Alignment.centerLeft,
             child: Text(
               productName,
               maxLines: 2,
               style: TextStyle(
                 fontWeight: FontWeight.w600,
                 fontSize: 16,
                 letterSpacing: 0.8,
                 overflow: TextOverflow.ellipsis,
               ),
             ),
           ),
          SizedBox(height: 7,),
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 7),
                child: CostWidget(
                    color: Colors.black, cost: cost
                ),
              ),
          ),
            SizedBox(height: 7,),
            Align(
              alignment: Alignment.centerLeft,
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(text: "Sold by", style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 16
                    ),
                    ),
                    TextSpan(text:  sellerName, style: TextStyle(
                        color: activeCyanColor,
                        fontSize: 14
                    ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
