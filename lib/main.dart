import 'package:expenses_app/transaction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final DateFormat dateFormat = DateFormat("yyyy-MM-dd hh:mm");
  
  final List<Transaction> transactions = [
    Transaction(id: 't1', amount: 69.99, title: "Apples", dateTime: DateTime.now()),
    Transaction(id: 't2', amount: 19.99, title: "New Shoes", dateTime: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
           Card(child: Container(child: Text('CHART'), width: double.infinity,), elevation: 5, color: Colors.blue,),
          Column(
            children: transactions.map((e) => Card(child: Row(children: [
              Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.purple, width: 2)
                  ),
                  child:
                    Text('\$${e.amount.toString()}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.purple
                        ),
                    ),),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text(e.title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                Text('${dateFormat.format(e.dateTime)}',
                style: TextStyle(color: Colors.grey),),
              ],)
            ],))).toList(),
          )
      ],),
    );
  }

}
