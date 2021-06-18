import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateInputWidget extends StatefulWidget {
  // const DateInputWidget({ Key? key }) : super(key: key);
  Color color;
  Color iconColor;
  FocusNode focus;
  FocusNode nextFocus;
  DateTime data;
  String text;

  DateInputWidget(
      {this.color,
      this.iconColor,
      this.focus,
      this.data,
      this.nextFocus,
      this.text});

  @override
  _DateInputWidgetState createState() => _DateInputWidgetState();
}

class _DateInputWidgetState extends State<DateInputWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: TextFormField(
        focusNode: widget.focus,
        readOnly: true,
        decoration: InputDecoration(
          icon: Icon(
            (Icons.date_range),
            color: widget.iconColor,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          helperText: widget.data != null ? widget.text : null,
          hintText: widget.data == null
              ? widget.text
              : DateFormat.yMMMMd().format(widget.data),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: widget.color),
          ),
        ),
        onTap: () {
          showDatePicker(
            context: context,
            initialDate: widget.data == null ? DateTime.now() : widget.data,
            firstDate: DateTime(2010),
            lastDate: DateTime(2100),
          ).then(
            (date) {
              setState(() {
                widget.data = date;
                print(widget.data);
                widget.focus.unfocus();
                FocusScope.of(context).requestFocus(widget.nextFocus);
              });
            },
          );
        },
      ),
    );
  }
}
