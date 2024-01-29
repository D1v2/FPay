import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateFormatFields extends StatefulWidget {
  final DateTime initialDate;
  final String dateFormat;
  final Function(DateTime) onChanged;

  const DateFormatFields({
    required this.initialDate,
    required this.dateFormat,
    required this.onChanged,
  });

  @override
  _DateFormatFieldsState createState() => _DateFormatFieldsState();
}

class _DateFormatFieldsState extends State<DateFormatFields> {
  late TextEditingController _controller;
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.initialDate;
    _controller = TextEditingController(
      text: DateFormat(widget.dateFormat).format(_selectedDate),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: _controller,
        readOnly: true,
        onTap: () {
          _selectDate(context);
        },
        decoration: InputDecoration(
            hintText: "DD/MM/YYYY",
            filled: true,
            hintStyle: const TextStyle(fontSize: 14),
            fillColor: Colors.white,
            suffixIcon: Icon(Icons.date_range),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: const BorderSide(color: Colors.white)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: const BorderSide(color: Colors.white))));
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _controller.text = DateFormat(widget.dateFormat).format(picked);
      });

      widget.onChanged(_selectedDate);
    }
  }
}
