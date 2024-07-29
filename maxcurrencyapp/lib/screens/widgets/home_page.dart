import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:maxcurrencyapp/model/currency_model.dart';
import 'package:maxcurrencyapp/screens/widgets/item_card.dart';

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
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                    image: DecorationImage(image: NetworkImage("https://flagsapi.com/${currencyData[index].code!}/flat/64.png")),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)
                    ),
                    margin:const EdgeInsets.all(15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                             Text("${currencyData[index].code} - ${currencyData[index].title}",style: const TextStyle(fontSize: 25),),
                           const  Padding(
                               padding:  EdgeInsets.all(10.0),
                               child: Icon(Icons.currency_exchange,size: 40,),
                             ),
                             Text(" ${currencyData[index].cbPrice} Uzbek Sum",style: const TextStyle(fontSize: 25))
                          ],
                        ),
      
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
            child: ListView.builder(
              itemCount: currencyData.length,
              itemBuilder: (context,index){
                return ItemCard(countryCode: currencyData[index].code.toString(),
                 price: currencyData[index].cbPrice.toString(),
                  title: currencyData[index].title.toString());
              }),
              ),
              ),
        ],
        ),
      )
    );
  }
}