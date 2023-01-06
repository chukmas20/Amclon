import 'package:flutter/material.dart';

class RatingWidget extends StatelessWidget {
  final int rating;
  const RatingWidget({
    Key? key,
    required this.rating
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List <Widget> children =[];

    for(int i =0; i < 5; i++){
      children.add(
          i < rating? Icon(Icons.star,color: Colors.deepOrange)
              : Icon(Icons.star_border, color: Colors.deepOrange)
      );
    }
    return Row(
       children: children,
    );
  }
}
