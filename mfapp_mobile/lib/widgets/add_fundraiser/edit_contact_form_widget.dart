import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'dart:convert';
import 'dart:io';

import '../../bin/colors.dart';
import '../../providers/new_fundraiser.dart';

class EditContactFormWidget extends StatefulWidget {
  Contacts contact;
  EditContactFormWidget({this.contact});
  @override
  _EditContactFormWidgetState createState() => _EditContactFormWidgetState();
}

class _EditContactFormWidgetState extends State<EditContactFormWidget> {
  final _formKey = GlobalKey<FormState>();
  File contactImage;
  final picker = ImagePicker();
  List<bool> selectedType = [true, false];

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.all(10),
      content: Builder(
        builder: (context) {
          var height = MediaQuery.of(context).size.height;
          var width = MediaQuery.of(context).size.width;
          return Container(
            height: height - 150,
            width: width / 1.3,
            child: Stack(
              overflow: Overflow.visible,
              children: <Widget>[
                Positioned(
                  right: -40.0,
                  top: -40.0,
                  child: InkResponse(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: CircleAvatar(
                      child: Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                      backgroundColor: Colors.red,
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      // mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: Text(
                            'Add New Contact',
                            style: TextStyle(
                              color: mfLettersColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: ToggleButtons(
                            isSelected: selectedType,
                            selectedColor: Colors.white,
                            fillColor: mfPrimaryColor,
                            color: mfLightGrey,
                            borderRadius: BorderRadius.circular(7),
                            selectedBorderColor: mfPrimaryColor,
                            constraints: BoxConstraints(
                              minHeight: 34,
                              minWidth: 60,
                            ),
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: Text('Relative/Next of Kin'),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 45),
                                child: Text('Survivor'),
                              ),
                            ],
                            onPressed: (int newIndex) {
                              setState(
                                () {
                                  for (int index = 0;
                                      index < selectedType.length;
                                      index++) {
                                    if (newIndex == 0) {
                                      selectedType[0] = true;
                                      selectedType[1] = false;
                                      widget.contact.contactType =
                                          'Relative/Next of Kin';
                                    } else {
                                      selectedType[0] = false;
                                      selectedType[1] = true;
                                      widget.contact.contactType = 'Survivor';
                                      setState(() {});
                                    }
                                  }
                                },
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: TextFormField(
                            onSaved: (val) {
                              if (val.isEmpty) {
                                return widget.contact.firstName =
                                    widget.contact.firstName;
                              }
                              return widget.contact.firstName = val;
                            },
                            textInputAction: TextInputAction.done,
                            decoration: InputDecoration(
                              labelText: widget.contact.firstName,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7),
                                borderSide: BorderSide(color: mfPrimaryColor),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: TextFormField(
                            onSaved: (val) {
                              if (val.isEmpty) {
                                return widget.contact.lastName =
                                    widget.contact.lastName;
                              }
                              return widget.contact.lastName = val;
                            },
                            textInputAction: TextInputAction.done,
                            decoration: InputDecoration(
                              labelText: widget.contact.lastName,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7),
                                borderSide: BorderSide(color: mfPrimaryColor),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: TextFormField(
                            onSaved: (val) {
                              if (val.isEmpty) {
                                return widget.contact.relationship =
                                    widget.contact.relationship;
                              }
                              return widget.contact.relationship = val;
                            },
                            textInputAction: TextInputAction.done,
                            decoration: InputDecoration(
                              labelText: widget.contact.relationship,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7),
                                borderSide: BorderSide(color: mfPrimaryColor),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: TextFormField(
                            onSaved: (val) {
                              if (val == null) {
                                return null;
                              } else if (val.isEmpty) {
                                return widget.contact.email =
                                    widget.contact.email;
                              } else {
                                return widget.contact.email = val;
                              }
                            },
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              labelText: widget.contact.email == null ||
                                      widget.contact.email.isEmpty
                                  ? 'Email'
                                  : widget.contact.email,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7),
                                borderSide: BorderSide(color: mfPrimaryColor),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: TextFormField(
                            onSaved: (val) {
                              if (val == null) {
                                return null;
                              } else if (val.isEmpty) {
                                return widget.contact.phoneNumber =
                                    widget.contact.phoneNumber;
                              } else {
                                return widget.contact.phoneNumber = val;
                              }
                            },
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: widget.contact.phoneNumber == null ||
                                      widget.contact.phoneNumber.isEmpty
                                  ? 'Phone Number'
                                  : widget.contact.phoneNumber,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7),
                                borderSide: BorderSide(color: mfPrimaryColor),
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: Container(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              children: [
                                Container(
                                  width: 200,
                                  height: 200,
                                  child: widget.contact.contactImage != null
                                      ? Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(20),
                                            ),
                                            image: DecorationImage(
                                              image: FileImage(
                                                  widget.contact.contactImage),
                                            ),
                                          ),
                                        )
                                      : Container(
                                          width: 200,
                                          height: 200,
                                          decoration: BoxDecoration(
                                            color: mfLightlightGrey,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(20),
                                            ),
                                          ),
                                          child: Center(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.add_a_photo,
                                                  size: 100,
                                                  color: mfLightGrey,
                                                ),
                                                Text(
                                                  'Select an image',
                                                  style: TextStyle(
                                                    color: mfLightGrey,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: ElevatedButton(
                                          onPressed: () async {
                                            final pickedFile =
                                                await picker.getImage(
                                                    source: ImageSource.camera);
                                            setState(() {
                                              contactImage =
                                                  File(pickedFile.path);
                                              final bytes =
                                                  File(pickedFile.path)
                                                      .readAsBytesSync();
                                              final fileName =
                                                  basename(contactImage.path);
                                              widget.contact.contactImage =
                                                  contactImage;
                                              widget.contact.image64 =
                                                  base64Encode(bytes);
                                              widget.contact.image =
                                                  fileName.toString();
                                            });
                                          },
                                          child: Text(
                                            'Camera',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 25, vertical: 15),
                                            primary: mfLightlightGrey,
                                            elevation: 1,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(40),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: ElevatedButton(
                                          onPressed: () async {
                                            final pickedFile =
                                                await picker.getImage(
                                                    source:
                                                        ImageSource.gallery);
                                            setState(
                                              () {
                                                contactImage =
                                                    File(pickedFile.path);
                                                final bytes =
                                                    File(pickedFile.path)
                                                        .readAsBytesSync();
                                                widget.contact.contactImage =
                                                    contactImage;
                                                final fileName =
                                                    basename(contactImage.path);
                                                widget.contact.image64 =
                                                    base64Encode(bytes);
                                                widget.contact.image =
                                                    fileName.toString();
                                              },
                                            );
                                          },
                                          child: Text(
                                            'Gallery',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 25, vertical: 12),
                                            primary: Colors.white,
                                            elevation: 1,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(40),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: RaisedButton(
                            color: mfPrimaryColor,
                            child: Text(
                              'Submit',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 35, vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            ),
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                _formKey.currentState.save();
                                Navigator.of(context).pop();
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
