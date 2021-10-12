import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'dart:convert';
import 'dart:io';

import '../../bin/colors.dart';
import '../../providers/fundraiser_details.dart';

class AddContactWidget extends StatefulWidget {
  FundraiserDetails data;
  AddContactWidget({
    this.data,
  });
  @override
  _AddContactWidgetState createState() => _AddContactWidgetState();
}

class _AddContactWidgetState extends State<AddContactWidget> {
  final _formKey = GlobalKey<FormState>();
  File contactImage;
  final picker = ImagePicker();
  EditContacts contact = new EditContacts();
  List<bool> selectedType = [true, false];

  @override
  Widget build(BuildContext context) {
    var data = widget.data;
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
                                  for (int index = 0;
                                      index < selectedType.length;
                                      index++) {
                                    if (newIndex == 0) {
                                      selectedType[0] = true;
                                      selectedType[1] = false;
                                      contact.contactType = 1;
                                    } else {
                                      selectedType[0] = false;
                                      selectedType[1] = true;
                                      contact.contactType = 2;
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
                            onSaved: (val) => contact.contactFirstName = val,
                            validator: (val) {
                              if (val.isEmpty) {
                                return 'Please provide a first name.';
                              }
                              return null;
                            },
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              labelText: 'First Name',
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
                            onSaved: (val) => contact.contactLastName = val,
                            validator: (val) {
                              if (val.isEmpty) {
                                return 'Please provide a last name.';
                              }
                              return null;
                            },
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              labelText: 'Last Name',
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
                            onSaved: (val) => contact.contactRelationship = val,
                            validator: (val) {
                              if (val.isEmpty) {
                                return 'Please provide a relationship.';
                              }
                              return null;
                            },
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              labelText: 'Relationship',
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
                                return null;
                              } else {
                                return contact.contactEmail = val;
                              }
                            },
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              labelText: 'Email',
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
                                return null;
                              } else {
                                return contact.contactPhone = val;
                              }
                            },
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: 'Phone Number',
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
                                Container(
                                  width: 200,
                                  height: 200,
                                  child: contactImage != null
                                      ? Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(20),
                                            ),
                                            image: DecorationImage(
                                              fit: BoxFit.fill,
                                              image: FileImage(contactImage),
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
                                      ElevatedButton(
                                        onPressed: () async {
                                          final pickedFile =
                                              await picker.getImage(
                                                  source: ImageSource.camera);
                                          setState(() {
                                            contactImage =
                                                File(pickedFile.path);
                                            final fileName =
                                                basename(contactImage.path);
                                            contact.contactFileImage =
                                                contactImage;

                                            contact.contactPhoto =
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
                                          primary: Colors.white,
                                          elevation: 1,
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
                                              contactImage =
                                                  File(pickedFile.path);

                                              contact.contactFileImage =
                                                  contactImage;
                                              final fileName =
                                                  basename(contactImage.path);

                                              contact.contactPhoto =
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
                                              horizontal: 25, vertical: 15),
                                          primary: Colors.white,
                                          elevation: 1,
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
                                horizontal: 35, vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            ),
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                _formKey.currentState.save();
                                if (data.contactList == null)
                                  data.contactList = List.empty(growable: true);
                                if (contact.contactType == null)
                                  contact.contactType = 1;
                                data.contactList.add(contact);
                                widget.data.contactList = data.contactList;
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
