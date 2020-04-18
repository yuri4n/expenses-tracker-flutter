import 'package:flutter/material.dart';

import '../models/transaction.dart';

import './transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(
            builder: (ctx, constraints) {
              return Column(
                children: <Widget>[
                  Text(
                    'No expenses registered',
                    style: Theme.of(context).textTheme.title,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      height: constraints.maxHeight * 0.4,
                      child: Image.asset(
                        'assets/images/box.png',
                        fit: BoxFit.cover,
                      )),
                ],
              );
            },
          )
        : ListView(children: [
            ...transactions.map((tx) {
              return TransactionItem(
                  key: ValueKey(tx.id), transaction: tx, deleteTx: deleteTx);
            }).toList(),
          ]);
  }
}
