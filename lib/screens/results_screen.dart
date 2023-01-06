import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobecom/model/product_model.dart';
import 'package:mobecom/widgets/results_widget.dart';
import 'package:mobecom/widgets/search_bar_widget.dart';

class ResultScreen extends StatelessWidget {
   final String query;
  const ResultScreen({Key? key, required this.query}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchBarWidget(isReadOnly: false, hasBackButton: true,),
      body: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: RichText(text: TextSpan(children: [
                TextSpan(
                  text: "Showing results for :",
                   style: TextStyle(
                     fontSize: 17,
                     color: Colors.black,
                   )
                ),
                TextSpan(
                    text: query,
                    style: TextStyle(
                      fontSize: 17,
                      fontStyle: FontStyle.italic,
                      color: Colors.black,
                    )
                ),
                ],
               ),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
                itemCount: 9,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, childAspectRatio: 2/3),
                itemBuilder:(context, index){
                  return ResultsWidget(product: ProductModel(
                      url: "https://ng.jumia.is/unsafe/fit-in/300x300/filters:fill(white)/product/12/4853821/1.jpg?1950",
                      cost: 160000,
                      discount: 1000,
                      noOfRating: 10,
                      productName: "Samsung Mobilehhhhhhhhhhhhhhhhhhhhhhhhhhh",
                      rating: 3,
                      sellerName: "John Ajaza",
                      sellerUid: "104y3",
                      uid: "205yu",

                   ),
                  );
                },
             ),
          ),
        ],
      ),
    );
  }
}
