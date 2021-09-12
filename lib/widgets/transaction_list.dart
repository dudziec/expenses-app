import 'package:expenses_app/models/transaction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final DateFormat dateFormat = DateFormat("yyyy-MM-dd hh:mm");
  final List<Transaction> transactions;
  final Function remove;

  TransactionList(this.transactions, this.remove);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 420,
      child: transactions.isEmpty
          ? Column(
              children: [
                Text(
                  'No transactions added yet!',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                  height: 200,
                )
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  child: ListTile(
                    leading: Padding(
                        padding: EdgeInsets.all(6.0),
                        child: FittedBox(
                            child: CircleAvatar(
                          radius: 30,
                          child: Text(
                            '\$${transactions[index].amount.toStringAsFixed(2)}',
                          ),
                        ))),
                    title: Text(transactions[index].title,
                        style: Theme.of(context).textTheme.headline5),
                    subtitle: Text(
                      '${dateFormat.format(transactions[index].dateTime)}',
                      style: TextStyle(color: Colors.grey),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        remove(transactions[index].id);
                      },
                      color: Theme.of(context).errorColor,
                      icon: Icon(Icons.delete),
                    ),
                  ),
                );
                //   Card(
                //     child: Row(
                //   children: [
                //     Container(
                //       margin: EdgeInsets.all(10),
                //       padding: EdgeInsets.all(10),
                //       decoration: BoxDecoration(
                //           border: Border.all(
                //               color: Theme.of(context).primaryColor, width: 2)),
                //       child: Text(
                //         '\$${transactions[index].amount.toStringAsFixed(2)}',
                //         style: TextStyle(
                //             fontWeight: FontWeight.w700,
                //             color: Theme.of(context).primaryColor),
                //       ),
                //     ),
                //     Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: [
                //         Text(transactions[index].title,
                //             style: Theme.of(context).textTheme.headline6),
                //         Text(
                //           '${dateFormat.format(transactions[index].dateTime)}',
                //           style: TextStyle(color: Colors.grey),
                //         ),
                //       ],
                //     )
                //   ],
                // ));
              },
              itemCount: transactions.length,
            ),
    );
  }
}
