import 'dart:ui';

import 'package:flutter/material.dart';


class CostWidget extends StatelessWidget {
  final Color color;
  final double  cost;

  const CostWidget({
    Key? key,
    required this.color,
    required this.cost
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
       mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "₦",
          style: TextStyle(
              fontSize: 10,fontFeatures: [FontFeature.superscripts()],
              color: color
          ),
        ),
        Text(cost.toInt().toString(), style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),),
        Text(
          (cost - cost.truncate()).toString(),
          style: TextStyle(
              fontSize: 10,
              fontFeatures: [FontFeature.superscripts()],
              color: color
          ),
        ),
      ],
    );
  }
}
