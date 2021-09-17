import 'package:flutter/material.dart';

import '../../../bin/colors.dart';
import '../../../providers/new_fundraiser.dart';
import '../../../widgets/add_fundraiser/decented_info/selected_location_widget.dart';
import '../../../screens/add_fundraiser/add_fundraiser_image.dart';

class FormWidget extends StatefulWidget {
  final locationData;
  FormWidget({this.locationData});

  @override
  _FormWidgetState createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  int i = 0;
  List<Color> _colors = [
    mfPrimaryColor,
    Colors.amber,
  ];
  List<bool> isSelected = [true, false];
  NewFundraiser newFund = NewFundraiser();
  final _formKey = GlobalKey<FormState>();
  TextEditingController _selectedBDateController = TextEditingController();
  TextEditingController _selectedPDateController = TextEditingController();
  TextEditingController _selectedEDateController = TextEditingController();
  DateTime selectedBdate = DateTime.now();
  DateTime selectedPdate = DateTime.now();
  DateTime selectedEdate = DateTime.now();

  _selectBDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: ThemeData.dark().copyWith(
              colorScheme: ColorScheme.light(
                primary: mfPrimaryColor,
                onPrimary: Colors.white,
                surface: mfPrimaryColor,
                onSurface: Colors.black,
              ),
              dialogBackgroundColor: Colors.white,
            ),
            child: child,
          );
        },
        initialDate: selectedBdate,
        firstDate: DateTime(1900),
        lastDate: DateTime(2150));
    if (picked != null && picked != selectedBdate)
      setState(() {
        selectedBdate = picked;
        var date =
            "${picked.toLocal().day}/${picked.toLocal().month}/${picked.toLocal().year}";
        _selectedBDateController.text = date;
      });
  }

  _selectPDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: ThemeData.dark().copyWith(
              colorScheme: ColorScheme.light(
                primary: mfPrimaryColor,
                onPrimary: Colors.white,
                surface: mfPrimaryColor,
                onSurface: Colors.black,
              ),
              dialogBackgroundColor: Colors.white,
            ),
            child: child,
          );
        },
        initialDate: selectedPdate,
        firstDate: DateTime(1900),
        lastDate: DateTime(2150));
    if (picked != null && picked != selectedPdate)
      setState(() {
        selectedPdate = picked;
        var date =
            "${picked.toLocal().day}/${picked.toLocal().month}/${picked.toLocal().year}";
        _selectedPDateController.text = date;
      });
  }

  _selectEDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: ThemeData.dark().copyWith(
              colorScheme: ColorScheme.light(
                primary: mfPrimaryColor,
                onPrimary: Colors.white,
                surface: mfPrimaryColor,
                onSurface: Colors.black,
              ),
              dialogBackgroundColor: Colors.white,
            ),
            child: child,
          );
        },
        initialDate: selectedEdate,
        firstDate: DateTime(1900),
        lastDate: DateTime(2150));
    if (picked != null && picked != selectedEdate)
      setState(() {
        selectedEdate = picked;
        var date =
            '${picked.toLocal().day}/${picked.toLocal().month}/${picked.toLocal().year}';
        _selectedEDateController.text = date;
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
              SelectedLocationWidget(widget.locationData.name),
              Container(
                margin: EdgeInsets.only(top: 15, bottom: 15),
                alignment: Alignment.center,
                child: ToggleButtons(
                  isSelected: isSelected,
                  selectedColor: Colors.white,
                  fillColor: _colors[i],
                  color: mfLightGrey,
                  borderRadius: BorderRadius.circular(7),
                  constraints: BoxConstraints(
                    minHeight: 34,
                    minWidth: 60,
                  ),
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text('Active'),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text('Draft'),
                    ),
                  ],
                  onPressed: (int newIndex) {
                    setState(() {
                      for (int index = 0; index < isSelected.length; index++) {
                        if (newIndex == 0) {
                          i = 0;
                          newFund.active = true;
                          newFund.draft = false;
                          isSelected[0] = true;
                          isSelected[1] = false;
                        } else if (newIndex == 1) {
                          i = 1;
                          newFund.draft = true;
                          newFund.active = false;
                          isSelected[0] = false;
                          isSelected[1] = true;
                        }
                      }
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 8),
                child: TextFormField(
                  onSaved: (val) => newFund.firstName = val,
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
                      return newFund.nickName = val;
                    }
                  },
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    labelText: 'Nick Name',
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
                      return newFund.middleName = val;
                    }
                  },
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    labelText: 'Middle Name',
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
                  onSaved: (val) => newFund.lastName = val,
                  validator: (val) {
                    if (val.isEmpty) {
                      return 'Please provide a last name.';
                    }
                    return null;
                  },
                  textInputAction: TextInputAction.done,
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
                      newFund.birthDate = selectedBdate.toString();
                    },
                    controller: _selectedBDateController,
                    decoration: InputDecoration(
                      labelText: 'Date of birth',
                      icon: Icon(
                        Icons.calendar_today,
                      ),
                      enabledBorder: InputBorder.none,
                    ),
                    validator: (value) {
                      if (value.isEmpty) return 'Please enter a date of birth';
                      return null;
                    },
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => _selectPDate(context),
                child: AbsorbPointer(
                  child: TextFormField(
                    style: TextStyle(color: mfPrimaryColor),
                    onSaved: (val) {
                      newFund.passingDate = selectedPdate.toString();
                    },
                    controller: _selectedPDateController,
                    decoration: InputDecoration(
                      labelText: 'Date of Passing',
                      icon: Icon(
                        Icons.calendar_today,
                      ),
                      enabledBorder: InputBorder.none,
                    ),
                    validator: (value) {
                      if (value.isEmpty)
                        return 'Please enter a date of Passing';
                      return null;
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 8),
                child: TextFormField(
                  onSaved: (val) => newFund.goalAmount = double.parse(val),
                  validator: (val) {
                    if (val.isEmpty) {
                      return 'Please set the goal amount.';
                    }
                    if (double.tryParse(val) == null) {
                      return 'Please enter a valid number.';
                    }
                    if (double.parse(val) <= 0) {
                      return 'Please enter a number greater than zero.';
                    }
                    return null;
                  },
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Fundraiser Goal Amount',
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
                onTap: () => _selectEDate(context),
                child: AbsorbPointer(
                  child: TextFormField(
                    style: TextStyle(color: mfPrimaryColor),
                    onSaved: (val) {
                      if (val.isEmpty) {
                        return null;
                      } else {
                        return newFund.expirationDate =
                            selectedEdate.toString();
                      }
                    },
                    controller: _selectedEDateController,
                    decoration: InputDecoration(
                      labelText: 'Fundraiser Expiration Date',
                      icon: Icon(
                        Icons.calendar_today,
                      ),
                      enabledBorder: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 40, 8, 40),
                child: ElevatedButton(
                  child: Text(
                    'Next: Upload Image',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: mfPrimaryColor,
                    shadowColor: mfPrimaryColor,
                    elevation: 5,
                    padding: EdgeInsets.symmetric(horizontal: 35, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                      newFund.locationId = widget.locationData.id;
                      newFund.mfvisibility = true;
                      newFund.dateCreated = DateTime.now().toString();
                      if (newFund.active == null && newFund.draft == null) {
                        newFund.draft = false;
                        newFund.active = true;
                      }
                      var newFundLocal = NewFundLocation(
                        id: widget.locationData.id,
                        stripeAccountId: widget.locationData.stripeAccountId,
                        userId: widget.locationData.userId,
                        name: widget.locationData.name,
                        email: widget.locationData.email,
                        phoneNumber: widget.locationData.phoneNumber,
                        address1: widget.locationData.address1,
                        address2: widget.locationData.address2,
                        city: widget.locationData.city,
                        state: widget.locationData.state,
                        postalCode: widget.locationData.postalCode,
                        country: widget.locationData.country,
                        taxId: widget.locationData.taxId,
                        website: widget.locationData.website,
                        logo: widget.locationData.logo,
                        stripeRequirements:
                            widget.locationData.stripeRequirements,
                        chargesEnabled: widget.locationData.chargesEnabled,
                        payoutsEnabled: widget.locationData.payoutsEnabled,
                        dateCreated: widget.locationData.dateCreated,
                        image: widget.locationData.image,
                      );
                      newFund.fundLocation = newFundLocal;
                      Navigator.pushNamed(context, ImagePickerScreen.routeName,
                          arguments: newFund);
                    }
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
