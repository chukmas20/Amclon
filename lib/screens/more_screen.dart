import 'package:flutter/material.dart';
import 'package:mobecom/utils/constants.dart';
import 'package:mobecom/widgets/category_widget.dart';
import 'package:mobecom/widgets/search_bar_widget.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchBarWidget(isReadOnly: true, hasBackButton:false ),
      body:  Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 2.2/ 3.5,
              mainAxisSpacing: 15,
              crossAxisSpacing: 10,
            ),
            itemCount: categoriesList.length,
            itemBuilder: (context, index) => CategoryWidget(index: index)
           ),
      ),
       );
  }
}
