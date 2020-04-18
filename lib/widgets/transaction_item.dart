import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionItem extends StatefulWidget {
  const TransactionItem({
    Key key,
    @required this.transaction,
    @required this.deleteTx,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteTx;

  @override
  _TransactionItemState createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  Color _bgColor;

  @override
  void initState() {
    super.initState();

    const availableColors = [
      Colors.red,
      Colors.black,
      Colors.blue,
      Colors.purple
    ];

    _bgColor = availableColors[Random().nextInt(4)];
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: <Widget>[
          Container(
            width: 80,
            height: 45,
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            decoration: BoxDecoration(
              border: Border.all(color: _bgColor, width: 2),
            ),
            padding: EdgeInsets.all(10),
            child: FittedBox(
              child: Text(
                '\$${widget.transaction.amount.toStringAsFixed(2)}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Theme.of(context).primaryColor,
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
                  Text(widget.transaction.title,
                      style: Theme.of(context).textTheme.title),
                  Text(
                    DateFormat.yMMMEd().format(widget.transaction.date),
                  ),
                ],
              ),
            ),
          ),
          MediaQuery.of(context).size.width > 360
              ? FlatButton.icon(
                  label: const Text('Delete'),
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    widget.deleteTx(widget.transaction.id);
                  },
                )
              : IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    widget.deleteTx(widget.transaction.id);
                  },
                )
        ],
      ),
    );
  }
}
