import 'package:flutter/material.dart';
import 'package:mobecom/model/product_model.dart';
import 'package:mobecom/utils/color__themes.dart';
import 'package:mobecom/utils/utils.dart';
import 'package:mobecom/widgets/cost_widget.dart';
import 'package:mobecom/widgets/rating_star_widget.dart';

class ResultsWidget extends StatelessWidget {
  final ProductModel product;
  const ResultsWidget({
    Key? key, required this.product
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    return GestureDetector(
      onTap: (){},
      child: Column(
        children: [
          SizedBox(
              width: screenSize.width / 3,
              child: Image.network(product.url)
          ),
          Text(product.productName, maxLines: 3, overflow: TextOverflow.ellipsis,),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
                   RatingWidget(
                      rating: product.rating
                  ),
              Text(product.noOfRating.toString(),style: TextStyle(
                 color: Colors.black,
              ),)
            ],
          ),
          CostWidget(
              color: Color.fromARGB(255,92,9,3),
              cost: product.cost,
          ),
        ],
      ),
    );
  }
}
