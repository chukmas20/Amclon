import 'package:flutter/material.dart';
import 'package:mobecom/model/product_model.dart';
import 'package:mobecom/model/user_detail_model.dart';
import 'package:mobecom/utils/color__themes.dart';
import 'package:mobecom/widgets/cart_item.dart';
import 'package:mobecom/widgets/custom_main_button.dart';
import 'package:mobecom/widgets/search_bar_widget.dart';
import 'package:mobecom/widgets/user_details_bar.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: SearchBarWidget(hasBackButton: false ,isReadOnly: true ),
       body: Center(
         child:Column(
           children: [
             UserDetailsBar(
                 offset: 0,
                 userDetails: UserDetailsModel(
                   name: "Yusuf",
                   address: "Lekki, Lagos"
                 )
             ),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: CustomMainButton(
                   child: Text("Proceed to buy (x) products",
                     style: TextStyle(color: Colors.black),
                   ),
                   color: yellowColor,
                   isLoading: false,
                   onPressed: (){},
               ),
             ),
             Expanded(
               child: ListView.builder(itemCount:5, itemBuilder: (context, index){
                  return CartItemWidget(
                    product: ProductModel(
                      url: "https://ng.jumia.is/unsafe/fit-in/300x300/filters:fill(white)/product/12/4853821/1.jpg?1950",
                      cost: 160000,
                      discount: 1000,
                      noOfRating: 10,
                      productName: "Samsung Mobile",
                      rating: 5,
                      sellerName: "John Ajaza",
                      sellerUid: "104y3",
                      uid: "205yu"
                    ),
                  );
               }),
             )
           ],
         ),
       ),
    );
  }
}
