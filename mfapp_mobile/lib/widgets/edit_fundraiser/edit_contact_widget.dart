import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'dart:convert';
import 'dart:io';

import '../../bin/colors.dart';
import '../../bin/api_addresses.dart';
import '../../providers/fundraiser_details.dart';

class EditContactWidget extends StatefulWidget {
  EditContacts contact;
  EditContactWidget({this.contact});
  @override
  _EditContactWidgetState createState() => _EditContactWidgetState();
}

class _EditContactWidgetState extends State<EditContactWidget> {
  final _formKey = GlobalKey<FormState>();
  final picker = ImagePicker();
  int index;
  List<bool> selectedType = [true, false];
  var pickedFile = null;
  File imageFile;

  pickImage(ImageSource source) async {
    pickedFile = await picker.getImage(source: source);
    final bytes = File(pickedFile.path).readAsBytesSync();
    setState(() {
      imageFile = File(pickedFile.path);
      widget.contact.contactImage = basename(imageFile.path).toString();
      widget.contact.contactImage64 = base64Encode(bytes);
    });
  }

  @override
  void initState() {
    super.initState();
    if (widget.contact.contactType == 1) {
      selectedType = [true, false];
    } else {
      selectedType = [false, true];
    }
  }

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
                                  for (index = 0;
                                      index < selectedType.length;
                                      index++) {
                                    if (newIndex == 0) {
                                      selectedType[0] = true;
                                      selectedType[1] = false;
                                      widget.contact.contactType = 1;
                                    } else {
                                      selectedType[0] = false;
                                      selectedType[1] = true;
                                      widget.contact.contactType = 2;
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
                                return widget.contact.contactFirstName =
                                    widget.contact.contactFirstName;
                              }
                              return widget.contact.contactFirstName = val;
                            },
                            textInputAction: TextInputAction.done,
                            decoration: InputDecoration(
                              labelText: widget.contact.contactFirstName,
                              helperText: 'First Name',
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: mfLightGrey,
                                ),
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(7),
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black26,
                                ),
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(7),
                                ),
                              ),
                              labelStyle: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 14,
                                color: Colors.black,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: mfPrimaryColor, width: 2.0),
                                borderRadius: BorderRadius.circular(7.0),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: TextFormField(
                            onSaved: (val) {
                              if (val.isEmpty) {
                                return widget.contact.contactLastName =
                                    widget.contact.contactLastName;
                              }
                              return widget.contact.contactLastName = val;
                            },
                            textInputAction: TextInputAction.done,
                            decoration: InputDecoration(
                              labelText: widget.contact.contactLastName,
                              helperText: 'Last Name',
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: mfLightGrey,
                                ),
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(7),
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black26,
                                ),
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(7),
                                ),
                              ),
                              labelStyle: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 14,
                                color: Colors.black,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: mfPrimaryColor, width: 2.0),
                                borderRadius: BorderRadius.circular(7.0),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: TextFormField(
                            onSaved: (val) {
                              if (val.isEmpty) {
                                return widget.contact.contactRelationship =
                                    widget.contact.contactRelationship;
                              }
                              return widget.contact.contactRelationship = val;
                            },
                            textInputAction: TextInputAction.done,
                            decoration: InputDecoration(
                              labelText: widget.contact.contactRelationship,
                              helperText: 'Relationship',
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: mfLightGrey,
                                ),
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(7),
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black26,
                                ),
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(7),
                                ),
                              ),
                              labelStyle: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 14,
                                color: Colors.black,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: mfPrimaryColor, width: 2.0),
                                borderRadius: BorderRadius.circular(7.0),
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
                                return widget.contact.contactEmail =
                                    widget.contact.contactEmail;
                              } else {
                                return widget.contact.contactEmail = val;
                              }
                            },
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              labelText: widget.contact.contactEmail == null ||
                                      widget.contact.contactEmail.isEmpty
                                  ? 'Email'
                                  : widget.contact.contactEmail,
                              helperText: 'Email',
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: mfLightGrey,
                                ),
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(7),
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black26,
                                ),
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(7),
                                ),
                              ),
                              labelStyle: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 14,
                                color: Colors.black,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: mfPrimaryColor, width: 2.0),
                                borderRadius: BorderRadius.circular(7.0),
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
                                return widget.contact.contactPhone =
                                    widget.contact.contactPhone;
                              } else {
                                return widget.contact.contactPhone = val;
                              }
                            },
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: widget.contact.contactPhone == null ||
                                      widget.contact.contactPhone.isEmpty
                                  ? 'Phone Number'
                                  : widget.contact.contactPhone,
                              helperText: 'Phone Number',
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: mfLightGrey,
                                ),
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(7),
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black26,
                                ),
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(7),
                                ),
                              ),
                              labelStyle: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 14,
                                color: Colors.black,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: mfPrimaryColor, width: 2.0),
                                borderRadius: BorderRadius.circular(7.0),
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: Container(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              children: [
                                widget.contact.contactFileImage == null
                                    ? ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: widget.contact.contactPhoto !=
                                                null
                                            ? Image.network(
                                                ApiProvider.baseUrl +
                                                    widget.contact.contactPhoto,
                                                width: 200,
                                                height: 200,
                                                fit: BoxFit.fill,
                                              )
                                            : Image.asset(
                                                'assets/images/helperImage.png',
                                                width: 200,
                                                height: 200,
                                                fit: BoxFit.fill,
                                              ),
                                      )
                                    : ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.file(
                                          widget.contact.contactFileImage,
                                          width: 200,
                                          height: 200,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                Container(
                                  margin: EdgeInsets.only(top: 15),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      ElevatedButton(
                                        onPressed: () async {
                                          final pickedFile =
                                              await picker.getImage(
                                                  source: ImageSource.camera);
                                          setState(() {
                                            final bytes = File(pickedFile.path)
                                                .readAsBytesSync();
                                            imageFile = File(pickedFile.path);
                                            widget.contact.contactFileImage =
                                                imageFile;
                                            final fileName =
                                                basename(imageFile.path);
                                            widget.contact.contactImage =
                                                fileName.toString();
                                            widget.contact.contactImage64 =
                                                base64Encode(bytes);
                                          });
                                        },
                                        child: Text(
                                          'Camera',
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.white,
                                          elevation: 1,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 35, vertical: 15),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(40),
                                              bottomLeft: Radius.circular(40),
                                            ),
                                          ),
                                        ),
                                      ),
                                      ElevatedButton(
                                        onPressed: () async {
                                          final pickedFile =
                                              await picker.getImage(
                                                  source: ImageSource.gallery);
                                          setState(
                                            () {
                                              final bytes =
                                                  File(pickedFile.path)
                                                      .readAsBytesSync();
                                              imageFile = File(pickedFile.path);
                                              widget.contact.contactFileImage =
                                                  imageFile;
                                              final fileName =
                                                  basename(imageFile.path);
                                              widget.contact.contactImage =
                                                  fileName.toString();
                                              widget.contact.contactImage64 =
                                                  base64Encode(bytes);
                                            },
                                          );
                                        },
                                        child: Text(
                                          'Gallery',
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.white,
                                          elevation: 1,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 35, vertical: 15),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(40),
                                              bottomRight: Radius.circular(40),
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
