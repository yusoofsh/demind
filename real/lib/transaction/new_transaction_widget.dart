import 'package:flutter/material.dart';

class NewTransactionWidget extends StatefulWidget {
  final Function(String, double) addNewTransaction;

  NewTransactionWidget(
    this.addNewTransaction,
  );

  @override
  _NewTransactionWidgetState createState() => _NewTransactionWidgetState();
}

class _NewTransactionWidgetState extends State<NewTransactionWidget> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  void _submitForm() {
    final _titleValue = _titleController.text;
    final _amountValue = double.parse(_amountController.text);

    if (_titleValue.isEmpty || _amountValue <= 0) {
      return;
    }

    widget.addNewTransaction(
      _titleController.text,
      double.parse(_amountController.text),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(8),
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
              onPressed: _submitForm,
            ),
          ],
        ),
      ),
    );
  }
}
