import 'package:flutter/material.dart';
import 'package:maxcurrencyapp/model/currency_model.dart';
import 'package:maxcurrencyapp/screens/widgets/custom_button.dart';
import 'package:maxcurrencyapp/screens/widgets/item_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.currencyData,});
  final List<CurrencyModel> currencyData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
        body: SafeArea(
          bottom: false,
      child:Column(
      
                children: [
                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text("Total price",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 20)),
                              Icon(Icons.mark_chat_unread_rounded,
                                  color: Colors.grey)
                            ],
                          ),
                          const SizedBox(height: 20),
                           Row(children: [
                            Text(
                                "\$ 2,445.",
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 40)),
                            Text(
                                 "21",
                                style: const TextStyle(
                                    color: Colors.grey, fontSize: 40))
                          ]),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              Text(
                                "+ \$ 252.",
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              Text(
                                "26 ",
                                style: const TextStyle(
                                    color: Colors.grey, fontSize: 20),
                              ),
                              const Text(
                                "4.28% ",
                                style: TextStyle(
                                    color: Colors.greenAccent, fontSize: 20),
                              ),
                            ],
                          ),
                          const SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomButton(
                                color: Colors.white,
                                text: "Buy",
                                textColor: Colors.black,
                              ),
                              CustomButton(
                                color: Colors.white.withOpacity(0.6),
                                text: "Sell",
                                textColor: Colors.white,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 7,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30),
                              topLeft: Radius.circular(30))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),
                          Center(
                            child: Container(
                              height: 5,
                              width: 50,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text("My portfolios",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.52,
                            child: ListView.builder(
              itemCount: currencyData.length,
              itemBuilder: (context,index){
                return ItemCard(countryCode: currencyData[index].code.toString(),
                 price: currencyData[index].cbPrice.toString(),
                  title: currencyData[index].title.toString(),  currencyData: [],);
              }),
              ),
              
                        ],
                      ),
                    ),
                  )
                ],
              )
      ),
    );
  }
}