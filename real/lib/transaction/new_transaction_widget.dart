import 'package:flutter/material.dart';

class NewTransactionWidget extends StatelessWidget {
  final Function(String, double) addNewTransaction;
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  NewTransactionWidget(
    this.addNewTransaction,
  );

  void _submitForm() {
    final _titleValue = _titleController.text;
    final _amountValue = double.parse(_amountController.text);

    if (_titleValue.isEmpty || _amountValue <= 0) {
      return;
    }

    addNewTransaction(
      _titleController.text,
      double.parse(_amountController.text),
    );
  }

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
              onSubmitted: (_) => _submitForm(),
              decoration: InputDecoration(
                labelText: 'Title',
              ),
            ),
            TextField(
              controller: _amountController,
              onSubmitted: (_) => _submitForm(),
              decoration: InputDecoration(
                labelText: 'Amount',
              ),
              keyboardType: TextInputType.numberWithOptions(
                decimal: true,
              ),
            ),
            TextButton(
              child: Text(
                'Add Transaction',
              ),
              style: TextButton.styleFrom(
                primary: Colors.purple,
              ),
              onPressed: _submitForm,
            ),
          ],
        ),
      ),
    );
  }
}
