import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTransaction;
  final titleInputController = TextEditingController();
  final amountInputController = TextEditingController();

  NewTransaction(this.addTransaction);

  void submitData() {
    final enteredTitle = this.titleInputController.text;
    final enteredAmount = this.amountInputController.text.isEmpty ? 0 : double.parse(this.amountInputController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    addTransaction(
        enteredTitle,
        enteredAmount
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: this.titleInputController,
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: this.amountInputController,
              onSubmitted: (_) => submitData(),
              keyboardType: TextInputType.number,
            ),
            FlatButton(
              child: Text('Add Transaction'),
              color: Colors.orangeAccent,
              onPressed: submitData,
            )
          ],
        ),
      ),
    );
  }
}
