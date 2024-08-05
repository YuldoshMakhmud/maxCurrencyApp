import 'package:flutter/material.dart';
import 'package:maxcurrencyapp/model/currency_model.dart';




class ItemCard extends StatelessWidget{
 const ItemCard({super.key, required this.currencyData, required this.title ,required this.countryCode, required this.price, required String flagUrl});
   final List<CurrencyModel> currencyData;
  final String countryCode;
  final String title;
  final String price;
  



  @override

  Widget build(BuildContext context){
    return Container(
      padding:const EdgeInsets.all(15),
      decoration: const BoxDecoration(color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(10))
      ),
      height: MediaQuery.of(context).size.height*0.1,
      margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
      child: Row(
        children: [
        const  CircleAvatar(
      radius: 35, // Adjust the radius as needed
    ),
       const   SizedBox(width: 20,),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
        Text(countryCode, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
        Text(title, style: const TextStyle(fontSize: 15, ),)
      ]
      ),
     const  Spacer(),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children:[
        Text(price, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
        const Text("1 Uzbek Sum", style:  TextStyle(fontSize: 15, ),)
      ]
      )
      ],),
      
    );
  }
}