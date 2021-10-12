import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../bin/colors.dart';
import '../../providers/provider.dart';
import '../../providers/new_fundraiser.dart';
import '../../screens/tabs_screen.dart';
import '../../screens/add_fundraiser/funeral_service_preview_screen.dart';

class FuneralServiceForm extends StatefulWidget {
  NewFundraiser data;

  FuneralServiceForm({
    this.data,
  });

  @override
  _FuneralServiceFormState createState() => _FuneralServiceFormState();
}

class _FuneralServiceFormState extends State<FuneralServiceForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _selectedDateController = TextEditingController();
  final _controllerAdditionalInfo = TextEditingController();
  final _controllerWebCast = TextEditingController();
  String info;
  DateTime selectedDate = DateTime.now();
  FuneralService funeral = FuneralService();
  String name;
  String address;
  String number;

  _selectBDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1900),
        lastDate: DateTime(2150));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        var date =
            "${picked.toLocal().day}/${picked.toLocal().month}/${picked.toLocal().year}";
        _selectedDateController.text = date;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                child: Text(
                  'If you want Funeral Service information for the decendent to be displayed on the Memorial Fundraiser page, enter the information here.',
                  style: TextStyle(
                    color: mfSecondaryLetterColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 8),
                child: TextFormField(
                  onSaved: (val) {
                    if (val.isEmpty) {
                      return null;
                    } else {
                      name = '\"Venue\":\"$val\",';
                      print(name);
                      return funeral.venueName = val;
                    }
                  },
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    labelText: 'Venue Name',
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
                      borderSide:
                          const BorderSide(color: mfPrimaryColor, width: 2.0),
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 8),
                child: TextFormField(
                  onSaved: (val) {
                    if (val.isEmpty) {
                      return null;
                    } else {
                      number = '\"VenuePhoneNumber\":\"$val\",';
                      print(number);
                      return funeral.venuePhoneNumber = val.toString();
                    }
                  },
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Venue Phone Number',
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
                      borderSide:
                          const BorderSide(color: mfPrimaryColor, width: 2.0),
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 8),
                child: TextFormField(
                  onSaved: (val) {
                    if (val.isEmpty) {
                      return null;
                    } else {
                      address = '\"Address\":\"$val\",';
                      print(address);
                      return funeral.venueAddress = val.toString();
                    }
                  },
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    labelText: 'Address',
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
                      borderSide:
                          const BorderSide(color: mfPrimaryColor, width: 2.0),
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 8),
                child: TextFormField(
                  onSaved: (val) {
                    if (val.isEmpty) {
                      return null;
                    } else {
                      return funeral.venueCity = val;
                    }
                  },
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    labelText: 'City',
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
                      borderSide:
                          const BorderSide(color: mfPrimaryColor, width: 2.0),
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 8),
                child: TextFormField(
                  onSaved: (val) {
                    if (val.isEmpty) {
                      return null;
                    } else {
                      return funeral.venueState = val;
                    }
                  },
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    labelText: 'State',
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
                      borderSide:
                          const BorderSide(color: mfPrimaryColor, width: 2.0),
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 8),
                child: TextFormField(
                  onSaved: (val) {
                    if (val.isEmpty) {
                      return null;
                    } else {
                      return funeral.venueZipCode = val.toString();
                    }
                  },
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Zip Code',
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
                      borderSide:
                          const BorderSide(color: mfPrimaryColor, width: 2.0),
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => _selectBDate(context),
                child: AbsorbPointer(
                  child: TextFormField(
                    style: TextStyle(color: mfPrimaryColor),
                    onSaved: (val) {
                      if (val.isEmpty) {
                        return null;
                      } else {
                        return funeral.venueDate = selectedDate.toString();
                      }
                    },
                    controller: _selectedDateController,
                    decoration: InputDecoration(
                      labelText: 'Date',
                      icon: Icon(
                        Icons.calendar_today,
                      ),
                      enabledBorder: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 8),
                child: TextFormField(
                  onSaved: (val) {
                    if (val.isEmpty) {
                      return null;
                    } else {
                      return funeral.venueTime = val.toString();
                    }
                  },
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    labelText: 'Time',
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
                      borderSide:
                          const BorderSide(color: mfPrimaryColor, width: 2.0),
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 8, bottom: 8),
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      funeral.venueWebCast = _controllerWebCast.text;
                    });
                  },
                  controller: _controllerWebCast,
                  keyboardType: TextInputType.url,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    labelText: 'Live Webcast',
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
                      borderSide:
                          const BorderSide(color: mfPrimaryColor, width: 2.0),
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 8),
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      funeral.venueAdditionalInfo =
                          _controllerAdditionalInfo.text;
                    });
                  },
                  controller: _controllerAdditionalInfo,
                  // keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.done,
                  maxLines: null,
                  decoration: InputDecoration(
                    labelText: 'Additional Information',
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
                      borderSide:
                          const BorderSide(color: mfPrimaryColor, width: 2.0),
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 40, 8, 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      child: Text(
                        'Preview:\nFuneral Service',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: mfPrimaryColor,
                        shadowColor: mfPrimaryColor,
                        elevation: 5,
                        padding:
                            EdgeInsets.symmetric(horizontal: 35, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                      onPressed: () {
                        _formKey.currentState.save();
                        var newService = FuneralService(
                          venueName: funeral.venueName,
                          venuePhoneNumber: funeral.venuePhoneNumber,
                          venueAddress: funeral.venueAddress,
                          venueCity: funeral.venueCity,
                          venueState: funeral.venueState,
                          venueZipCode: funeral.venueZipCode,
                          venueDate: funeral.venueDate,
                          venueTime: funeral.venueTime,
                          venueWebCast: funeral.venueWebCast,
                          venueAdditionalInfo: funeral.venueAdditionalInfo,
                          service: '{$name$number$address}',
                        );
                        widget.data.funeralService = newService;
                        Navigator.pushNamed(
                            context, FuneralServicePreviewScreen.routeName,
                            arguments: widget.data);
                      },
                    ),
                    ElevatedButton(
                      child: Text(
                        'Complete\nFundraiser',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: mfPrimaryColor,
                        shadowColor: mfPrimaryColor,
                        elevation: 5,
                        padding:
                            EdgeInsets.symmetric(horizontal: 35, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                      onPressed: () {
                        _formKey.currentState.save();
                        var newService = FuneralService(
                          venueName: funeral.venueName,
                          venuePhoneNumber: funeral.venuePhoneNumber,
                          venueAddress: funeral.venueAddress,
                          venueCity: funeral.venueCity,
                          venueState: funeral.venueState,
                          venueZipCode: funeral.venueZipCode,
                          venueDate: funeral.venueDate,
                          venueTime: funeral.venueTime,
                          venueWebCast: funeral.venueWebCast,
                          venueAdditionalInfo: funeral.venueAdditionalInfo,
                          service: '{$name$number$address}',
                        );
                        widget.data.funeralService = newService;
                        Provider.of<Fundraisers>(context, listen: false)
                            .addNewFundraiser(widget.data);
                        Navigator.pushNamedAndRemoveUntil(
                            context, TabsScreen.routeName, (r) => false);
                      },
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
