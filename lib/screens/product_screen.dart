import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobecom/model/product_model.dart';
import 'package:mobecom/model/user_detail_model.dart';
import 'package:mobecom/utils/color__themes.dart';
import 'package:mobecom/utils/constants.dart';
import 'package:mobecom/utils/utils.dart';
import 'package:mobecom/widgets/cost_widget.dart';
import 'package:mobecom/widgets/custom_main_button.dart';
import 'package:mobecom/widgets/rating_star_widget.dart';
import 'package:mobecom/widgets/search_bar_widget.dart';
import 'package:mobecom/widgets/user_details_bar.dart';

class ProductScreen extends StatefulWidget {
  final ProductModel productModel;
  const ProductScreen({Key? key, required this.productModel}) : super(key: key);

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    return
        Scaffold(
          appBar: SearchBarWidget(isReadOnly: true, hasBackButton: true),
          body: Stack(
            children: [
              SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                       children: [
                         SizedBox(height: kAppBarHeight),
                         Padding(
                           padding: const EdgeInsets.symmetric(vertical: 10),
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Padding(
                                     padding: const EdgeInsets.only(bottom: 5),
                                     child: Text(widget.productModel.sellerName,
                                       style: TextStyle(
                                         color: activeCyanColor,
                                         fontSize: 16,
                                       ),
                                     ),
                                   ),
                                   Text(widget.productModel.productName,)
                                 ],
                               ),
                               RatingWidget(rating: widget.productModel.rating),
                             ],
                           ),
                         ),
                         Padding(
                           padding: const EdgeInsets.all(15),
                           child: Container(
                             height: screenSize.height / 3,
                             child:Image.network(widget.productModel.url),
                           ),
                         ),
                         CostWidget(color: Colors.black, cost: widget.productModel.cost),
                         CustomMainButton(
                             child: Text(
                               "Buy Now", style: TextStyle(color: Colors.black),
                             ),
                             color: Colors.orange,
                             isLoading: false,
                             onPressed: (){},
                         ),
                       ],
                    ),
                  ),
              ),
              UserDetailsBar(offset: 0, userDetails: UserDetailsModel(
                  name: "John Gahdi",
                  address: "Lekki Lagos"
              ),
              ),
            ],
          ),
        );
  }
}
