import 'package:flutter/material.dart';
import 'package:maxcurrencyapp/screens/widgets/exchanger_page.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class CustomButton extends StatelessWidget {
  Color color;
  String text;
  Color textColor;
  CustomButton({Key? key, required this.color, required this.text, required this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: (){
         Navigator.push(context, MaterialPageRoute(builder: (context)=> ExchengerPage()));
      },
      
      child: Container(
        height: 70,
        width: 170,
        decoration:
            BoxDecoration(color: color, borderRadius: BorderRadius.circular(20)),
        child: Center(child: Text(text, style: TextStyle(color: textColor, fontSize: 20, fontWeight: FontWeight.bold),),),
      ),
    );
  }
}