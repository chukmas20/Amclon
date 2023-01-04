import 'package:flutter/material.dart';
import 'package:mobecom/model/user_detail_model.dart';
import 'package:mobecom/utils/constants.dart';
import 'package:mobecom/widgets/banner_widget.dart';
import 'package:mobecom/widgets/categories_horrizontal_view.dart';
import 'package:mobecom/widgets/product_showcase_listView.dart';
import 'package:mobecom/widgets/search_bar_widget.dart';
import 'package:mobecom/widgets/simple_product_widget.dart';
import 'package:mobecom/widgets/user_details_bar.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController controller = ScrollController();
  double offSet = 0;

  @override
  void initState(){
    super.initState();
    controller.addListener(() {
      setState(() {
        offSet = controller.position.pixels;
      });
    });
  }
  @override
  void dispose(){
    super.dispose();
    controller.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
       appBar: SearchBarWidget(
         isReadOnly: true,
         hasBackButton: false,
       ),
       body: Stack(
         children: [
           SizedBox(
             height: kAppBarHeight /2,
           ),
           SingleChildScrollView(
             controller: controller,
             child: Column(
               children: [
                 CategoriesHorrizontalListViewBar(),
                 BannerAdWidget(),
                 ProductsShowCaseListView(
                     title: "Get 65% discount",
                     children:
                        testChildren,
                 ),
                 ProductsShowCaseListView(
                   title: "Get 65% discount",
                   children:
                     testChildren,
                 ),
                 ProductsShowCaseListView(
                   title: "Get 65% discount",
                   children: testChildren,
                 ),
               ],
             ),
           ),
           UserDetailsBar(
               offset: offSet,
               userDetails: UserDetailsModel(
                 name:"Ifeanyi",
                 address:"Abuja",
               ),
           ),
         ],
       ),
    );
  }
}
