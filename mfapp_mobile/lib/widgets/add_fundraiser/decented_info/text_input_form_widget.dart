import 'package:flutter/material.dart';

class TextInputWidget extends StatelessWidget {
  Color color;
  FocusNode focus;
  FocusNode nextFocus;
  String data;
  String text;

  TextInputWidget(
      {this.color, this.focus, this.data, this.nextFocus, this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: TextFormField(
        cursorColor: color,
        decoration: InputDecoration(
          labelText: text,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: color),
          ),
        ),
        //Ti eikonidio tha dixnei katw sto pliktrologio
        autofocus: true,
        focusNode: focus,
        textInputAction: TextInputAction.next,
        onFieldSubmitted: (fName) {
          data = fName;
          print(text + ' ' + data);
          focus.unfocus();
          FocusScope.of(context).requestFocus(nextFocus);
        },
      ),
    );
  }
}
