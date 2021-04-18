import 'package:flutter/material.dart';

class NewTransactionWidget extends StatelessWidget {
  final Function(String, double) addNewTransaction;
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  NewTransactionWidget(
    this.addNewTransaction,
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Title',
              ),
            ),
            TextField(
              controller: _amountController,
              decoration: InputDecoration(
                labelText: 'Amount',
              ),
            ),
            TextButton(
              child: Text(
                'Add Transaction',
              ),
              style: TextButton.styleFrom(
                primary: Colors.purple,
              ),
              onPressed: () {
                addNewTransaction(
                  _titleController.text,
                  double.parse(_amountController.text),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
