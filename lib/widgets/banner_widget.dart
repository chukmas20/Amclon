import 'package:flutter/material.dart';
import 'package:mobecom/utils/color__themes.dart';
import 'package:mobecom/utils/constants.dart';
import 'package:mobecom/utils/utils.dart';

class BannerAdWidget extends StatefulWidget {
  const BannerAdWidget({Key? key}) : super(key: key);

  @override
  _BannerAdWidgetState createState() => _BannerAdWidgetState();
}

class _BannerAdWidgetState extends State<BannerAdWidget> {
  int currentAd = 0;
  double smallAdHeight = 125;


  @override
  Widget build(BuildContext context) {
     Size screenSize = Utils().getScreenSize();

     return GestureDetector(
       onHorizontalDragEnd: (_){
         if(currentAd == (largeAds.length - 1)){
           currentAd = -1;
         }
         setState(() {
           currentAd++;
         });
       },
      child: Column(

        children: [
          Stack(
             children: [
             Image.network(
              largeAds[currentAd],
               width: double.infinity,
              ),
               Positioned(
                 bottom: 0,
                 child: Container(
                   width: screenSize.width,
                   height: 125,
                   decoration: BoxDecoration(
                       gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                           end: Alignment.topCenter,
                           colors:[
                             backgroundColor,
                             backgroundColor.withOpacity(0),
                           ],

                       ),
                   ),
                 ),
               ),
             ],
          ),
          Container(
            color: backgroundColor,
            width: screenSize.width,
            height: smallAdHeight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                getSmallAdsFromIndex(0, smallAdHeight),
                getSmallAdsFromIndex(1, smallAdHeight),
                getSmallAdsFromIndex(2, smallAdHeight),
                getSmallAdsFromIndex(3, smallAdHeight),

              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget getSmallAdsFromIndex(int index, double height){
       return Container(
         height: height,
          width: 85,
          decoration: ShapeDecoration(
              color: Colors.white,
              shadows: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 5,
                   spreadRadius: 1,
                ),
              ],
              shape: RoundedRectangleBorder(
                borderRadius:BorderRadius.circular(10),
              ),
          ),
         child: Center(
           child: Column(
             mainAxisSize: MainAxisSize.min,
             children: [
               Image.network(smallAds[index]),
                    Text(adItemNames[index])
             ],
           ),
         ),
       );
  }
}
