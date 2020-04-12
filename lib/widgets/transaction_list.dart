import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: transactions.isEmpty ? Column(children: <Widget>[
        Text(
          'No expenses registered',
          style: Theme
              .of(context)
              .textTheme
              .title,
        ),
        SizedBox(
          height: 20,
        ),
        Container(
            height: 100,
            child: Image.asset('assets/images/box.png', fit: BoxFit.cover,
            )),
      ],) : ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(
                      vertical: 10, horizontal: 20
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Theme
                        .of(context)
                        .primaryColor, width: 2),
                  ),
                  padding: EdgeInsets.all(10),
                  child: Text(
                    '\$${transactions[index].amount.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Theme
                          .of(context)
                          .primaryColor,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                        transactions[index].title,
                        style: Theme
                            .of(context)
                            .textTheme
                            .title
                    ),
                    Text(
                      DateFormat.yMMMEd().format(transactions[index].date),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
        itemCount: transactions.length,
      ),
    );
  }
}
