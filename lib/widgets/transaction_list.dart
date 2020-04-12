import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

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
                  width: 80,
                  height: 45,
                  margin: EdgeInsets.symmetric(
                      vertical: 10, horizontal: 20
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Theme
                        .of(context)
                        .primaryColor, width: 2),
                  ),
                  padding: EdgeInsets.all(10),
                  child: FittedBox(
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
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Column(
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
                  ),
                ),
                IconButton(icon: Icon(Icons.delete), onPressed: () {
                  deleteTx(transactions[index].id);
                },)
              ],
            ),
          );
        },
        itemCount: transactions.length,
      ),
    );
  }
}
