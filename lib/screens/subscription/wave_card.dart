import 'package:e_plaza_vendor/values/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

//set this class on home: attribute at main.dart file
class WaveCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 200,
      // width: 90.w,
      margin: EdgeInsets.all(12),
      decoration: BoxDecoration(
        //decoration for the outer wrapper
        color: Colors.deepOrangeAccent,
        borderRadius: BorderRadius.circular(16), //border radius exactly to ClipRRect
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), //color of shadow
            spreadRadius: 3, //spread radius
            blurRadius: 3, // blur radius
            offset: Offset(0, 2), // changes position of shadow
            //first paramerter of offset is left-right
            //second parameter is top to down
          ),
          //you can set more BoxShadow() here
        ],
      ),
      child: ClipRRect(
        //to clip overflown positioned containers.
        borderRadius: BorderRadius.circular(12),
        //if we set border radius on container, the overflown content get displayed at corner.
        child: Container(
            child: Stack(
          children: <Widget>[
            //Stack helps to overlap widgets
            Positioned(
                //positioned helps to position widget wherever we want.
                top: -20,
                left: -50, //position of the widget
                child: Container(
                    height: 250,
                    width: 250,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.orange.withOpacity(0.5) //background color with opacity
                        ))),

            Positioned(
                left: -80,
                top: -50,
                child: Container(
                    height: 180,
                    width: 180,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.redAccent.withOpacity(0.5)))),

            Positioned(
              //main content container postition.
              child: Container(
                  height: 250,
                  alignment: Alignment.center,
                  child: Text(
                    "Stacked Containers Together",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  )),
            )
          ],
        )),
      ),
    );
  }
}
