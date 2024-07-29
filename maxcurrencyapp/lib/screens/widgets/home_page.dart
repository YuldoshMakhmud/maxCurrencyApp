import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:maxcurrencyapp/model/currency_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.currencyData});
  final List<CurrencyModel> currencyData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          bottom: false,
      child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
                
                children: [
               SizedBox(
                height: MediaQuery.of(context).size.height*0.25,
                child: Swiper(itemCount: currencyData.length, itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      image: DecorationImage(image: NetworkImage("https://countryflagsapi.com/:filetype/:${currencyData[index].code}")),
                    color: Colors.white,
                      borderRadius: BorderRadius.circular(15)
                    ),
                        child: Center(child: Text(currencyData[index].code!),),
      
                  );
                } ,
                ),
              ),
              ],
              )
              ),

            Expanded(
              flex: 6,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25)),
                color: Colors.white,
                ),
              ))
        ],
        
        
        ),
      )
    );
  }
}