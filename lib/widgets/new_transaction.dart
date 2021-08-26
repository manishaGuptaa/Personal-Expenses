import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addtx;

  NewTransaction(this.addtx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _seletedDate = DateTime.now();

  // void _submitData(String val) {
  //   if (_amountController.text.isEmpty) return;
  //   final enterTitle = _titleController.text;
  //   final enterAmount = double.parse(_amountController.text);
  //
  //   if (enterTitle.isEmpty || enterAmount <= 0) {
  //     return;
  //   }
  //   widget.addtx(
  //     enterTitle,
  //     enterAmount,
  //     _seletedDate,
  //   );
  //   Navigator.of(context).pop();
  // }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) return;
      setState(() {
        _seletedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
          TextField(
            decoration: InputDecoration(labelText: 'Title'),
            controller: _titleController,
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Amount'),
            controller: _amountController,
            keyboardType: TextInputType.number,
            // onSubmitted: (_) => _submitData(_),
          ),
          Container(
            height: 70,
            child: Row(
              children: <Widget>[
                Expanded(
                    child: Text(
                        'Picked Date: ${DateFormat.yMd().format(_seletedDate)}')),
                TextButton(
                  onPressed: _presentDatePicker,
                  child: Text(
                    'Choose Date',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),
          ElevatedButton(
            child: Text("Add Transection"),
            onPressed:
                 // () => _submitData,
                () {
                  if (_amountController.text.isEmpty) return;
                  final enterTitle = _titleController.text;
                  final enterAmount = double.parse(_amountController.text);

                  if (enterTitle.isEmpty || enterAmount <= 0) {
                    return;
                  }
                  widget.addtx(
                    enterTitle,
                    enterAmount,
                    _seletedDate,
                  );
                  Navigator.of(context).pop();

            },
          )
        ]));
  }
}
