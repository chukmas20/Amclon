import 'package:flutter/material.dart';
import 'package:mobecom/utils/color__themes.dart';

import '../utils/constants.dart';

class ScreenLayout extends StatefulWidget {
  const ScreenLayout({Key? key}) : super(key: key);

  @override
  _ScreenLayoutState createState() => _ScreenLayoutState();
}

class _ScreenLayoutState extends State<ScreenLayout> {
  PageController pageController = PageController();
  int currentPage = 0;
  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: PageView(
          controller: pageController,
          children:screens,
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color: Colors.grey[400]!,width: 1),
            )
          ),
          child: TabBar(
            indicator: BoxDecoration(
                border: Border(
                    top: BorderSide(
                        color:activeCyanColor,
                        width: 4,
                    ),
                ),
            ),
             onTap: (int page){
                pageController.jumpToPage(page);
                setState(() {
                  currentPage = page;
                });
             },
              indicatorSize: TabBarIndicatorSize.label,
              tabs: [
            Tab(
              child: Icon(
                Icons.home_outlined,
                color: currentPage==0?activeCyanColor:Colors.black,
               ),
            ),
            Tab(
              child: Icon(
                Icons.account_circle_outlined,
                color: currentPage==1?activeCyanColor:Colors.black,
              ),
            ),
            Tab(
              child: Icon(
                Icons.shopping_cart_outlined,
                color: currentPage==2?activeCyanColor:Colors.black,
              ),
            ),
            Tab(
              child: Icon(
                Icons.menu,
                color: currentPage==3?activeCyanColor:Colors.black,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
