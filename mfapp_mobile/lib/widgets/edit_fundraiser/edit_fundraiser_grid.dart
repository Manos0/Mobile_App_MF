import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:path/path.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'dart:typed_data';
import 'dart:convert';
import 'dart:io';

import './add_contact_widget.dart';
import './edit_contact_widget.dart';
import '../../screens/tabs_screen.dart';
import '../../bin/api_addresses.dart';
import '../../bin/my_flutter_app_icons.dart';
import '../../bin/colors.dart';
import '../../bin/functions.dart';
import '../../providers/fundraiser_details.dart';
import '../../providers/provider.dart';

class EditFundraiserGrid extends StatefulWidget {
  FundraiserDetails fundDetails;
  EditFundraiserGrid({this.fundDetails});
  static const routeName = '/edit-fundraiser';
  @override
  _EditFundraiserGridState createState() => _EditFundraiserGridState();
}

class _EditFundraiserGridState extends State<EditFundraiserGrid> {
  TextEditingController _controllerWritenByYou = TextEditingController();
  List<String> templateList = [
    'Default Template',
    'From the family',
    'From the deceased',
    'Sudden passing',
    'Accident / Tragedy / Event',
  ];
  bool writenByYou = false;
  bool checkedValue = false;
  bool checkedValueFam = false;
  bool checkedValueSud = false;
  bool checkedValueATE = false;
  String gend = 'him';
  String gendFamily = 'him';
  String gendSudden = 'him';
  String fromTheFamily1 = 'I am';
  String fromTheFamily2 = 'I';
  String fromTheFamily3 = '';
  String sudden1 = 'I am';
  String sudden2 = 'I have decided to honor my';
  String sudden3 = 'I';
  String sudden4 = '';
  String aTE1 = 'I';
  String aTE2 = '';
  String aTegend1 = 'man';
  String aTegend2 = 'His';
  int i = 0;
  List<Color> _colors = [
    mfPrimaryColor,
    Colors.amber,
  ];
  List<bool> isSelected = [true, false];
  List<bool> selection = [true, false];
  List<bool> selectedGender = [true, false];
  List<bool> selectedGenderFam = [true, false];
  List<bool> selectedGenderSud = [true, false];
  List<bool> selectedGenderATE = [true, false];
  // String _chosenValue = 'Default Template';
  String _chosenValue;
  static const values = <String>['morning', 'evening'];
  String selectedValue = values.first;
  final _controllerFullName = TextEditingController();
  final _controllerDefaultTemplate = TextEditingController();
  final _controllerFromTheFamily = TextEditingController();
  final _controllerFromTheDeceased = TextEditingController();
  final _controllerSuddenPassing = TextEditingController();
  final _controllerATE = TextEditingController();
  TextEditingController _selectedDateController = TextEditingController();
  String occured = 'early morning hours';
  String formatted;
  TextEditingController _firstName = TextEditingController();
  TextEditingController _nickName = TextEditingController();
  TextEditingController _middleName = TextEditingController();
  TextEditingController _lastName = TextEditingController();
  TextEditingController _goalAmount = TextEditingController();
  TextEditingController _birthDateController = TextEditingController();
  TextEditingController _passingDateController = TextEditingController();
  TextEditingController _expirationDateController = TextEditingController();
  TextEditingController _venueNameController = TextEditingController();
  TextEditingController _venuePhoneController = TextEditingController();
  TextEditingController _venueAddressController = TextEditingController();
  TextEditingController _venueCityController = TextEditingController();
  TextEditingController _venueStateController = TextEditingController();
  TextEditingController _venueZipController = TextEditingController();
  TextEditingController _venueTimeController = TextEditingController();
  TextEditingController _venueDateController = TextEditingController();
  TextEditingController _venueLiveWebController = TextEditingController();
  TextEditingController _venueAddInfoController = TextEditingController();
  File fundraiserAvatar;
  var pickedFile = null;
  File imageFile;
  Uint8List bytes;
  final picker = ImagePicker();
  DateTime pickedBDate;
  DateTime pickedPDate;
  DateTime pickedEDate;
  DateTime pickedServiceDate;
  DateTime pickedATEDate;

  Widget buildRadios() => Column(
        mainAxisSize: MainAxisSize.min,
        children: values.map((value) {
          return SizedBox(
            height: 35,
            child: RadioListTile<String>(
              activeColor: mfPrimaryColor,
              contentPadding: EdgeInsets.all(0),
              dense: true,
              value: value,
              groupValue: selectedValue,
              title: Text(
                value,
                style: TextStyle(
                  color: mfLettersColor,
                  fontSize: 14,
                ),
              ),
              onChanged: (value) => setState(() {
                if (selectedValue == 'morning') {
                  this.selectedValue = value;
                  return occured = 'late evening hours';
                } else {
                  this.selectedValue = value;
                  return occured = 'early morning hours';
                }
              }),
            ),
          );
        }).toList(),
      );

  pickImage(ImageSource source) async {
    pickedFile = await picker.getImage(source: source);
    setState(() {
      imageFile = File(pickedFile.path);
      bytes = File(pickedFile.path).readAsBytesSync();
      fundraiserAvatar = imageFile;
    });
  }

  _selectBDate(BuildContext context) async {
    pickedBDate = await showDatePicker(
        context: context,
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: ThemeData.light().copyWith(
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
        initialDate: DateTime.parse(widget.fundDetails.birthDate),
        firstDate: DateTime(1900),
        lastDate: DateTime(2150));
    if (pickedBDate != null)
      setState(() {
        var date =
            "${pickedBDate.toLocal().day}/${pickedBDate.toLocal().month}/${pickedBDate.toLocal().year}";
        _birthDateController.text = date;
      });
  }

  _selectPDate(BuildContext context) async {
    pickedPDate = await showDatePicker(
        context: context,
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: ThemeData.light().copyWith(
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
        initialDate: DateTime.parse(widget.fundDetails.passingDate),
        firstDate: DateTime(1900),
        lastDate: DateTime(2150));
    if (pickedPDate != null)
      setState(() {
        var date =
            "${pickedPDate.toLocal().day}/${pickedPDate.toLocal().month}/${pickedPDate.toLocal().year}";
        _passingDateController.text = date;
      });
  }

  _selectedATEDate(BuildContext context) async {
    pickedATEDate = await showDatePicker(
        context: context,
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: ThemeData.light().copyWith(
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
        initialDate: widget.fundDetails.expirationDate != null
            ? DateTime.parse(widget.fundDetails.expirationDate)
            : DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2150));
    if (pickedATEDate != null)
      setState(() {
        var date =
            "${pickedATEDate.toLocal().day}/${pickedATEDate.toLocal().month}/${pickedATEDate.toLocal().year}";
        _selectedDateController.text = date;
      });
  }

  _selectEDate(BuildContext context) async {
    pickedEDate = await showDatePicker(
        context: context,
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: ThemeData.light().copyWith(
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
        initialDate: widget.fundDetails.expirationDate != null
            ? DateTime.parse(widget.fundDetails.expirationDate)
            : DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2150));
    if (pickedEDate != null)
      setState(() {
        var date =
            "${pickedEDate.toLocal().day}/${pickedEDate.toLocal().month}/${pickedEDate.toLocal().year}";
        _expirationDateController.text = date;
      });
  }

  _selectServiceDate(BuildContext context) async {
    pickedServiceDate = await showDatePicker(
        context: context,
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: ThemeData.light().copyWith(
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
        initialDate: DateTime.parse(widget.fundDetails.venueDate),
        firstDate: DateTime(1900),
        lastDate: DateTime(2150));
    if (pickedServiceDate != null)
      setState(() {
        var date =
            "${pickedServiceDate.toLocal().day}/${pickedServiceDate.toLocal().month}/${pickedServiceDate.toLocal().year}";
        _venueDateController.text = date;
      });
  }

  String formatDate(String date) {
    var dateTime = DateTime.parse(date);
    return DateFormat.yMd().format(dateTime);
  }

  @override
  void initState() {
    super.initState();
    if (widget.fundDetails.firstName != null) {
      _firstName.text = widget.fundDetails.firstName;
    }
    if (widget.fundDetails.nickName != null) {
      _nickName.text = widget.fundDetails.nickName;
    }
    if (widget.fundDetails.middleName != null) {
      _middleName.text = widget.fundDetails.middleName;
    }
    if (widget.fundDetails.lastName != null) {
      _lastName.text = widget.fundDetails.lastName;
    }
    if (widget.fundDetails.goalAmount != null) {
      _goalAmount.text = widget.fundDetails.goalAmount.toString();
    }
    if (widget.fundDetails.birthDate != null) {
      _birthDateController =
          TextEditingController(text: formatDate(widget.fundDetails.birthDate));
    }
    if (widget.fundDetails.passingDate != null) {
      _passingDateController = TextEditingController(
          text: formatDate(widget.fundDetails.passingDate));
    }
    if (widget.fundDetails.expirationDate != null) {
      _expirationDateController = TextEditingController(
          text: formatDate(widget.fundDetails.expirationDate));
    }
    if (widget.fundDetails.template == false &&
        widget.fundDetails.fundContent != null) {
      _controllerWritenByYou =
          TextEditingController(text: widget.fundDetails.fundContent);
      selection = [false, true];
      writenByYou = true;
    } else {
      selection = [true, false];
    }
    if (widget.fundDetails.authorname != null) {
      _controllerFullName.text = widget.fundDetails.authorname;
    }
    if (widget.fundDetails.textSelection == 1) {
      _chosenValue = 'Default Template';
      if (widget.fundDetails.gender != null) {
        if (widget.fundDetails.gender == 'male') {
          selectedGender = [true, false];
          gend = 'him';
        } else {
          selectedGender = [false, true];
          gend = 'her';
        }
      }
    } else if (widget.fundDetails.textSelection == 2) {
      _chosenValue = 'From the family';
      if (widget.fundDetails.gender != null) {
        if (widget.fundDetails.gender == 'male') {
          selectedGenderFam = [true, false];
          gendFamily = 'him';
        } else {
          selectedGenderFam = [false, true];
          gendFamily = 'her';
        }
      }
      if (widget.fundDetails.author == true) {
        checkedValueFam = true;
        fromTheFamily1 = 'As a family we are';
        fromTheFamily2 = 'we';
        fromTheFamily3 =
            'The Family of ${widget.fundDetails.firstName}${widget.fundDetails.nickName == null ? '' : ' ' + widget.fundDetails.nickName}${widget.fundDetails.middleName == null ? '' : ' ' + widget.fundDetails.middleName} ${widget.fundDetails.lastName}';
      } else {
        checkedValueFam = false;
        fromTheFamily1 = 'I am';
        fromTheFamily2 = 'I';
        fromTheFamily3 = _controllerFullName.text;
      }
    } else if (widget.fundDetails.textSelection == 3) {
      _chosenValue = 'From the deceased';
    } else if (widget.fundDetails.textSelection == 4) {
      _chosenValue = 'Sudden passing';
      if (widget.fundDetails.gender != null) {
        if (widget.fundDetails.gender == 'male') {
          selectedGenderSud = [true, false];
          gendSudden = 'him';
        } else {
          selectedGenderSud = [false, true];
          gendSudden = 'her';
        }
      }
      if (widget.fundDetails.author == true) {
        checkedValueSud = true;
        sudden1 = 'We are';
        sudden2 = 'as a family have decided to honor our';
        sudden3 = 'we';
        sudden4 =
            'The Family of ${widget.fundDetails.firstName}${widget.fundDetails.nickName == null ? '' : ' ' + widget.fundDetails.nickName}${widget.fundDetails.middleName == null ? '' : ' ' + widget.fundDetails.middleName} ${widget.fundDetails.lastName}';
      } else {
        checkedValueSud = false;
        sudden1 = 'I am';
        sudden2 = 'I';
        sudden3 = 'I';
        sudden4 = _controllerFullName.text;
      }
    } else {
      _chosenValue = 'Accident / Tragedy / Event';
      if (widget.fundDetails.gender != null) {
        if (widget.fundDetails.gender == 'male') {
          selectedGenderATE = [true, false];
          aTegend1 = 'man';
          aTegend2 = 'His';
        } else {
          selectedGenderATE = [false, true];
          aTegend1 = 'woman';
          aTegend2 = 'Her';
        }
      }
      if (widget.fundDetails.author == true) {
        checkedValueATE = true;
        aTE1 = 'we';
        aTE2 =
            'The Family of ${widget.fundDetails.firstName}${widget.fundDetails.nickName == null ? '' : ' ' + widget.fundDetails.nickName}${widget.fundDetails.middleName == null ? '' : ' ' + widget.fundDetails.middleName} ${widget.fundDetails.lastName}';
      } else {
        checkedValueATE = false;
        aTE1 = 'I';
        aTE2 = _controllerFullName.text;
      }
      if (widget.fundDetails.eventTime == 'morning') {
        selectedValue = 'morning';
        occured = 'early morning hours';
      } else {
        selectedValue = 'evening';
        occured = 'late evening hours';
      }
      if (widget.fundDetails.eventDate != null) {
        _selectedDateController = TextEditingController(
            text: formatDate(widget.fundDetails.eventDate));
        DateFormat formatter = DateFormat('yMMMMEEEEd');
        formatted =
            formatter.format(DateTime.parse(widget.fundDetails.eventDate));
      }
    }

    if (widget.fundDetails.venueName != null) {
      _venueNameController.text = widget.fundDetails.venueName;
    }
    if (widget.fundDetails.venuePhoneNumber != null) {
      _venuePhoneController.text = widget.fundDetails.venuePhoneNumber;
    }
    if (widget.fundDetails.venueAddress != null) {
      _venueAddressController.text = widget.fundDetails.venueAddress;
    }
    if (widget.fundDetails.venueCity != null) {
      _venueCityController.text = widget.fundDetails.venueCity;
    }
    if (widget.fundDetails.venueState != null) {
      _venueStateController.text = widget.fundDetails.venueState;
    }
    if (widget.fundDetails.venueZipCode != null) {
      _venueZipController.text = widget.fundDetails.venueZipCode;
    }
    if (widget.fundDetails.venueTime != null) {
      _venueTimeController.text = widget.fundDetails.venueTime;
    }
    if (widget.fundDetails.venueDate != null) {
      _venueDateController =
          TextEditingController(text: formatDate(widget.fundDetails.venueDate));
    }
    if (widget.fundDetails.liveWebcast != null) {
      _venueLiveWebController.text = widget.fundDetails.liveWebcast;
    }
    if (widget.fundDetails.venueAdditionalInfo != null) {
      _venueAddInfoController.text = widget.fundDetails.venueAdditionalInfo;
    }
  }

  @override
  Widget build(BuildContext context) {
    DateFormat formatter = DateFormat('yMMMMEEEEd');
    if (pickedATEDate != null) {
      formatted = formatter.format(pickedATEDate);
    } else {
      formatted = formatter.format(DateTime.now());
    }
    _controllerDefaultTemplate.text =
        'The ${widget.fundDetails.lastName} family is deeply saddened to announce the passing of ${widget.fundDetails.firstName} and offers a special way to honor $gend.\n\nIn lieu of flowers, food, sympathy cards or charitable donations the family is requesting donations by clicking on the \'Donate Now\' button in order to allow those who loved and knew $gend the answer to the question...\“Is there anything I can do?\”.\n\nWhile donating you will be able to offer your condolences by writing a message which will appear below as well as choose to remain anonymous.\n\nAll donations are directly deposited to ${widget.fundDetails.location.locationName} for complete transparency & security.\n\n${widget.fundDetails.location.locationName} has been entrusted with funeral arrangements.';
    _controllerFromTheFamily.text =
        '$fromTheFamily1 deeply saddened to announce the passing of my beloved ${widget.fundDetails.firstName} ${widget.fundDetails.lastName} and have decided to honor $gendFamily by having a memorial fundraiser. In lieu of flowers, food or charitable donations, your contribution will be greatly appreciated and $fromTheFamily2 thank you in advance. In order to donate, please click on the \'Donate Now\' button. All donations are directly deposited to the funeral home for complete transparency & security. While donating you will be able to write a message, offer your condolences, as well as choose to have your name or contribution anonymous.\n\nIf you are unable to donate then $fromTheFamily2 ask that you please click and \"Share this Fundraiser\" located under the Donate section. The success of the fundraiser depends on how well it is shared to all social media platforms, email and text.\n\nWarmest Regards and Greatly Appreciated,\n\n$fromTheFamily3';
    _controllerFromTheDeceased.text =
        '"Hello Family and Friends. I want to thank everyone for their thoughts and prayers. I know my family and friends will miss me dearly, but this is not goodbye, this is... ‘we will meet again’. Until then, I would truly appreciate, and ask in lieu of flowers, food or charitable donations, that a contribution be made to my fundraiser and... I thank you in advance. In order to donate, please click on the \'Donate\' button. All donations are directly deposited to the funeral home for complete transparency & security. While donating you will be able to write a message, offer your condolences as well as choose to have your name or contribution amount remain anonymous.\n\nIf you are unable to donate then I ask that you please click on the ‘Share This Fundraiser’ button located under the ‘Donate Now’ button. The success of the fundraiser depends on how well it is shared to all social media platforms, email and text.\n\nMay my smile forever stay within your heart.\n\n${widget.fundDetails.firstName}${widget.fundDetails.nickName == null ? '' : ' ' + widget.fundDetails.nickName}${widget.fundDetails.middleName == null ? '' : ' ' + widget.fundDetails.middleName} ${widget.fundDetails.lastName}';
    _controllerSuddenPassing.text =
        '$sudden1 deeply saddened to announce the sudden passing of our beloved ${widget.fundDetails.firstName} ${widget.fundDetails.lastName}. With this passing being so sudden, $sudden2 ${widget.fundDetails.firstName} by having a memorial fundraiser. In lieu of flowers, food or charitable donations, your contribution will be greatly appreciated and $sudden3 thank you in advance. In order to donate, please click on the \'Donate Now\' button. All donations are directly deposited to the funeral home for complete transparency & security. While donating you will be able to write a message, offer your condolences, as well as choose to have your name or contribution anonymous.\n\nIf you are unable to donate then $sudden3 ask that you please click and "Share this Fundraiser" located under the Donate section. The success of the fundraiser depends on how well it is shared to all social media platforms, email and text.\n\nWarmest Regards and Greatly Appreciated,\n\n$sudden4';
    _controllerATE.text =
        'In the $occured of $formatted my family and I suffered a major loss. ${widget.fundDetails.firstName} was an amazing $aTegend1 loved by many and will be missed by all. $aTegend2 untimely passing has left us with many unexpected financial burdens. $aTE1 have decided to honor my ${widget.fundDetails.firstName} by having a memorial fundraiser. In lieu of flowers, food or charitable donations, your contribution will be greatly appreciated and $aTE1 thank you in advance. In order to donate, please click on the \'Donate Now\' button. All donations are directly deposited to the funeral home for complete transparency & security. While donating you will be able to write a message, offer your condolences, as well as choose to have your name or contribution anonymous.\n\n If you are unable to donate then $aTE1 ask that you please click and "Share this Fundraiser" located under the Donate section. The success of the fundraiser depends on how well it is shared to all social media platforms, email and text.\n\nWarmest Regards and Greatly Appreciated,\n\n$aTE2';
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 4,
        iconTheme: IconThemeData(color: mfLightGrey),
        title: Text(
          'Edit Fundraiser',
          style: TextStyle(
            color: mfLettersColor,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [color, color2],
          ),
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(bottom: 15),
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
                          isSelected[0] = true;
                          isSelected[1] = false;
                        } else if (newIndex == 1) {
                          i = 1;
                          isSelected[0] = false;
                          isSelected[1] = true;
                        }
                      }
                    });
                  },
                ),
              ),
              Theme(
                data: Theme.of(context)
                    .copyWith(dividerColor: Colors.transparent),
                child: ExpansionTile(
                  textColor: mfPrimaryColor,
                  tilePadding: EdgeInsets.zero,
                  childrenPadding: EdgeInsets.only(top: 5),
                  title: Text('Edit personal info:'),
                  children: [
                    TextField(
                      controller: _firstName,
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
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: TextField(
                        controller: _nickName,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          labelText: 'Nickname',
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
                      padding: const EdgeInsets.only(top: 15, bottom: 15),
                      child: TextField(
                        controller: _middleName,
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
                            borderSide: const BorderSide(
                                color: mfPrimaryColor, width: 2.0),
                            borderRadius: BorderRadius.circular(7),
                          ),
                        ),
                      ),
                    ),
                    TextField(
                      controller: _lastName,
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
                          borderRadius: BorderRadius.circular(7),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => _selectBDate(context),
                      child: AbsorbPointer(
                        child: TextFormField(
                          style: TextStyle(color: mfPrimaryColor),
                          controller: _birthDateController,
                          decoration: InputDecoration(
                            labelText: 'Date of birth',
                            icon: Icon(
                              Icons.calendar_today,
                            ),
                            enabledBorder: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => _selectPDate(context),
                      child: AbsorbPointer(
                        child: TextFormField(
                          style: TextStyle(color: mfPrimaryColor),
                          controller: _passingDateController,
                          decoration: InputDecoration(
                            labelText: 'Date of Passing',
                            icon: Icon(
                              Icons.calendar_today,
                            ),
                            enabledBorder: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    TextField(
                      controller: _goalAmount,
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
                          borderSide: const BorderSide(
                              color: mfPrimaryColor, width: 2.0),
                          borderRadius: BorderRadius.circular(7.0),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => _selectEDate(context),
                      child: AbsorbPointer(
                        child: TextFormField(
                          style: TextStyle(color: mfPrimaryColor),
                          controller: _expirationDateController,
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
                  ],
                ),
              ),
              Theme(
                data: Theme.of(context)
                    .copyWith(dividerColor: Colors.transparent),
                child: ExpansionTile(
                  textColor: mfPrimaryColor,
                  tilePadding: EdgeInsets.zero,
                  childrenPadding: EdgeInsets.only(top: 5),
                  title: Text('Edit fundraiser photo:'),
                  children: [
                    Container(
                      width: 220,
                      height: 180,
                      margin: EdgeInsets.only(top: 15),
                      child: fundraiserAvatar == null
                          ? Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                                image: DecorationImage(
                                  image: fundImage(
                                      widget.fundDetails.clientAvatarMD),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )
                          : Container(
                              width: 300,
                              height: 250,
                              decoration: BoxDecoration(
                                color: mfLightlightGrey,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                                image: DecorationImage(
                                  image: FileImage(fundraiserAvatar),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              pickImage(ImageSource.camera);
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
                            onPressed: () {
                              pickImage(ImageSource.gallery);
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
              Theme(
                data: Theme.of(context)
                    .copyWith(dividerColor: Colors.transparent),
                child: ExpansionTile(
                  textColor: mfPrimaryColor,
                  tilePadding: EdgeInsets.zero,
                  childrenPadding: EdgeInsets.fromLTRB(0, 5, 0, 15),
                  title: Text('Edit contacts:'),
                  children: [
                    Column(
                      children: List.generate(
                        widget.fundDetails.contactList.length,
                        (index) {
                          return Container(
                            width: MediaQuery.of(context).size.width / 1.1,
                            child: Slidable(
                              actionPane: SlidableDrawerActionPane(),
                              actionExtentRatio: 1 / 5,
                              secondaryActions: [
                                if (widget.fundDetails.contactList[index]
                                        .contactPhone !=
                                    null)
                                  Card(
                                    margin: EdgeInsets.symmetric(vertical: 4),
                                    child: IconSlideAction(
                                      caption: 'Call',
                                      color: mfPrimaryColor,
                                      icon: Icons.call_outlined,
                                      onTap: () {
                                        launch(
                                            'tel://${widget.fundDetails.contactList[index].contactPhone}');
                                      },
                                    ),
                                  ),
                                if (widget.fundDetails.contactList[index]
                                        .contactEmail !=
                                    null)
                                  Card(
                                    margin: EdgeInsets.symmetric(vertical: 4),
                                    child: IconSlideAction(
                                      caption: 'Email',
                                      color: mfPrimaryColor.withOpacity(0.70),
                                      icon: Icons.email_outlined,
                                      onTap: () {
                                        launch(
                                            'mailto:${widget.fundDetails.contactList[index].contactEmail}');
                                      },
                                    ),
                                  ),
                                Card(
                                  margin: EdgeInsets.symmetric(vertical: 4),
                                  child: IconSlideAction(
                                    caption: 'Edit',
                                    color: Colors.grey,
                                    icon: Icons.mode_edit_outlined,
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return EditContactWidget(
                                            contact: widget
                                                .fundDetails.contactList[index],
                                          );
                                        },
                                      ).then((_) => setState(() {}));
                                    },
                                  ),
                                ),
                                Card(
                                  color: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(0),
                                      topRight: Radius.circular(13),
                                      bottomLeft: Radius.circular(0),
                                      bottomRight: Radius.circular(13),
                                    ),
                                  ),
                                  margin: EdgeInsets.symmetric(vertical: 4),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(0),
                                      topRight: Radius.circular(13),
                                      bottomLeft: Radius.circular(0),
                                      bottomRight: Radius.circular(13),
                                    ),
                                    child: IconSlideAction(
                                      caption: 'Delete',
                                      color: Colors.red,
                                      icon: Icons.delete_outline_rounded,
                                      onTap: () {
                                        widget.fundDetails.contactList
                                            .removeAt(index);
                                        setState(() {});
                                      },
                                    ),
                                  ),
                                ),
                              ],
                              child: Card(
                                margin: EdgeInsets.only(bottom: 4, top: 4),
                                elevation: 4,
                                shadowColor: Color.fromRGBO(247, 247, 247, 100),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(13),
                                    topRight: Radius.circular(0),
                                    bottomLeft: Radius.circular(13),
                                    bottomRight: Radius.circular(0),
                                  ),
                                ),
                                child: ListTile(
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 10,
                                  ),
                                  trailing: Icon(
                                    Icons.arrow_right_rounded,
                                    size: 35,
                                  ),
                                  title: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        widget.fundDetails.contactList[index]
                                                .contactFirstName +
                                            ' ' +
                                            widget
                                                .fundDetails
                                                .contactList[index]
                                                .contactLastName,
                                        style: TextStyle(
                                          color: mfLettersColor,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 19,
                                        ),
                                      ),
                                      if (widget.fundDetails.contactList[index]
                                              .contactEmail !=
                                          null)
                                        Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 5),
                                              child: Icon(
                                                Icons.alternate_email_rounded,
                                                color: mfThrirdLetterColor,
                                                size: 20,
                                              ),
                                            ),
                                            Text(
                                              widget
                                                  .fundDetails
                                                  .contactList[index]
                                                  .contactEmail,
                                              style: TextStyle(
                                                color: mfThrirdLetterColor,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        ),
                                      if (widget.fundDetails.contactList[index]
                                              .contactPhone !=
                                          null)
                                        Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 5),
                                              child: Icon(
                                                Icons.phone,
                                                color: mfThrirdLetterColor,
                                                size: 20,
                                              ),
                                            ),
                                            Text(
                                              widget
                                                  .fundDetails
                                                  .contactList[index]
                                                  .contactPhone,
                                              style: TextStyle(
                                                color: mfThrirdLetterColor,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        ),
                                    ],
                                  ),
                                  leading: widget.fundDetails.contactList[index]
                                              .contactFileImage ==
                                          null
                                      ? ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(60),
                                          child: widget
                                                      .fundDetails
                                                      .contactList[index]
                                                      .contactPhoto !=
                                                  null
                                              ? Image.network(
                                                  baseUrl +
                                                      widget
                                                          .fundDetails
                                                          .contactList[index]
                                                          .contactPhoto,
                                                  width: 50,
                                                  height: 50,
                                                  fit: BoxFit.fill,
                                                )
                                              : Image.asset(
                                                  'assets/images/helperImage.png',
                                                  width: 50,
                                                  height: 50,
                                                  fit: BoxFit.fill,
                                                ),
                                        )
                                      : ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(60),
                                          child: Image.file(
                                            widget
                                                .fundDetails
                                                .contactList[index]
                                                .contactFileImage,
                                            width: 50,
                                            height: 50,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: ElevatedButton(
                          child: Text(
                            'Add New Contact',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                horizontal: 35, vertical: 12),
                            primary: mfPrimaryColor,
                            shadowColor: mfPrimaryColor,
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            ),
                          ),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AddContactWidget(
                                  data: widget.fundDetails,
                                );
                              },
                            ).then((_) => setState(() {}));
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Theme(
                data: Theme.of(context)
                    .copyWith(dividerColor: Colors.transparent),
                child: ExpansionTile(
                  textColor: mfPrimaryColor,
                  tilePadding: EdgeInsets.zero,
                  childrenPadding: EdgeInsets.only(top: 5),
                  title: Text('Edit story:'),
                  children: [
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 15),
                          alignment: Alignment.center,
                          child: ToggleButtons(
                            isSelected: selection,
                            selectedColor: Colors.white,
                            color: mfLightGrey,
                            fillColor: mfPrimaryColor,
                            borderRadius: BorderRadius.circular(6),
                            constraints: BoxConstraints(
                                minHeight: 30,
                                minWidth:
                                    (MediaQuery.of(context).size.width - 36) /
                                        2),
                            children: [
                              Text('Use one of our Templates'),
                              Text('Write the Obituary'),
                            ],
                            onPressed: (int newIndex) {
                              setState(
                                () {
                                  for (int index = 0;
                                      index < isSelected.length;
                                      index++) {
                                    if (newIndex == 0) {
                                      selection[0] = true;
                                      selection[1] = false;
                                      writenByYou = false;
                                    } else {
                                      selection[0] = false;
                                      selection[1] = true;
                                      writenByYou = true;
                                      setState(() {});
                                    }
                                  }
                                },
                              );
                            },
                          ),
                        ),
                        if (writenByYou)
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            padding: const EdgeInsets.all(3.0),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: mfPrimaryColor,
                              ),
                            ),
                            child: TextField(
                              controller: _controllerWritenByYou,
                              textInputAction: TextInputAction.done,
                              maxLines: 8,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Insert text here ...',
                                contentPadding: EdgeInsets.all(5),
                              ),
                            ),
                          )
                        else
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 20, bottom: 20),
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Obituary options:',
                                    style: TextStyle(
                                      color: mfLettersColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                              Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                margin: EdgeInsets.only(bottom: 20),
                                elevation: 2,
                                shadowColor: mfLightlightGrey,
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width / 1.1,
                                  padding: EdgeInsets.all(5),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        child: MaterialButton(
                                          onPressed: null,
                                          disabledColor: mfLightGreen,
                                          child: Icon(
                                            MyFlutterApp.i001_layout,
                                            color: mfPrimaryColor,
                                            size: 24,
                                          ),
                                          shape: CircleBorder(),
                                          padding: EdgeInsets.all(8),
                                          minWidth: 0,
                                          color: mfLightGreen,
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.all(5),
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.4,
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 10,
                                            vertical: 2,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                          ),
                                          child: DropdownButtonHideUnderline(
                                            child: DropdownButton<String>(
                                              isDense: true,
                                              focusColor: Colors.white,
                                              value: _chosenValue,
                                              isExpanded: true,
                                              style: TextStyle(
                                                  color: Colors.white),
                                              iconEnabledColor: mfLettersColor,
                                              iconSize: 30,
                                              items: templateList.map<
                                                      DropdownMenuItem<String>>(
                                                  (String value) {
                                                return DropdownMenuItem<String>(
                                                  value: value,
                                                  child: Text(
                                                    value,
                                                    style: TextStyle(
                                                      color: mfLettersColor,
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                );
                                              }).toList(),
                                              hint: Text(
                                                templateList[0],
                                                style: TextStyle(
                                                  color: mfLettersColor,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              onChanged: (String value) {
                                                setState(() {
                                                  _chosenValue = value;
                                                });
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              if (_chosenValue == 'Default Template')
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 15, bottom: 15),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Deseased Gender',
                                            style: TextStyle(
                                              color: mfThrirdLetterColor,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          ToggleButtons(
                                            isSelected: selectedGender,
                                            selectedColor: Colors.white,
                                            color: mfLightGrey,
                                            fillColor: mfPrimaryColor,
                                            borderRadius:
                                                BorderRadius.circular(6),
                                            constraints: BoxConstraints(
                                              minHeight: 30,
                                              minWidth: 90,
                                            ),
                                            children: [
                                              Text('Male'),
                                              Text('Female'),
                                            ],
                                            onPressed: (int newIndex) {
                                              setState(
                                                () {
                                                  for (int index = 0;
                                                      index <
                                                          selectedGender.length;
                                                      index++) {
                                                    if (newIndex == 0) {
                                                      selectedGender[0] = true;
                                                      selectedGender[1] = false;
                                                      gend = 'him';
                                                    } else {
                                                      selectedGender[0] = false;
                                                      selectedGender[1] = true;
                                                      gend = 'her';
                                                    }
                                                  }
                                                },
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                      child: Text(
                                        'Obituary text:',
                                        style: TextStyle(
                                          color: mfLettersColor,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: TextField(
                                        controller: _controllerDefaultTemplate,
                                        style: TextStyle(
                                            color: mfThrirdLetterColor),
                                        readOnly: true,
                                        maxLines: null,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                        ),
                                        textAlign: TextAlign.justify,
                                      ),
                                    ),
                                  ],
                                )
                              else if (_chosenValue == 'From the family')
                                Padding(
                                  padding: const EdgeInsets.only(top: 15),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextField(
                                        controller: _controllerFullName,
                                        keyboardType: TextInputType.multiline,
                                        maxLines: null,
                                        textInputAction: TextInputAction.done,
                                        decoration: InputDecoration(
                                          labelText: 'Provide your full name',
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: mfLightGrey,
                                            ),
                                            borderRadius:
                                                const BorderRadius.all(
                                              const Radius.circular(7),
                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.black26,
                                            ),
                                            borderRadius:
                                                const BorderRadius.all(
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
                                                color: mfPrimaryColor,
                                                width: 2.0),
                                            borderRadius:
                                                BorderRadius.circular(7.0),
                                          ),
                                        ),
                                        onSubmitted: (value) {
                                          setState(() {
                                            _controllerFullName.text = value;
                                            fromTheFamily3 =
                                                _controllerFullName.text;
                                          });
                                        },
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 15),
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              1.5,
                                          child: CheckboxListTile(
                                            activeColor: mfPrimaryColor,
                                            contentPadding: EdgeInsets.all(0),
                                            title: Text(
                                              'Use \"As a family\"',
                                              style: TextStyle(
                                                color: mfThrirdLetterColor,
                                                fontSize: 14,
                                              ),
                                              textAlign: TextAlign.left,
                                            ),
                                            value: checkedValueFam,
                                            onChanged: (newValue) {
                                              setState(() {
                                                checkedValueFam = newValue;
                                                if (checkedValueFam) {
                                                  fromTheFamily1 =
                                                      'As a family we are';
                                                  fromTheFamily2 = 'we';
                                                  fromTheFamily3 =
                                                      'The Family of ${widget.fundDetails.firstName}${widget.fundDetails.nickName == null ? '' : ' ' + widget.fundDetails.nickName}${widget.fundDetails.middleName == null ? '' : ' ' + widget.fundDetails.middleName} ${widget.fundDetails.lastName}';
                                                } else {
                                                  fromTheFamily1 = 'I am';
                                                  fromTheFamily2 = 'I';
                                                  fromTheFamily3 =
                                                      _controllerFullName.text;
                                                }
                                              });
                                            },
                                            controlAffinity:
                                                ListTileControlAffinity.leading,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 15, bottom: 15),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Deseased Gender',
                                              style: TextStyle(
                                                color: mfThrirdLetterColor,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            ToggleButtons(
                                              isSelected: selectedGenderFam,
                                              selectedColor: Colors.white,
                                              color: mfLightGrey,
                                              fillColor: mfPrimaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                              constraints: BoxConstraints(
                                                minHeight: 30,
                                                minWidth: 90,
                                              ),
                                              children: [
                                                Text('Male'),
                                                Text('Female'),
                                              ],
                                              onPressed: (int newIndex) {
                                                setState(
                                                  () {
                                                    for (int index = 0;
                                                        index <
                                                            selectedGenderFam
                                                                .length;
                                                        index++) {
                                                      if (newIndex == 0) {
                                                        selectedGenderFam[0] =
                                                            true;
                                                        selectedGenderFam[1] =
                                                            false;
                                                        gendFamily = 'him';
                                                      } else {
                                                        selectedGenderFam[0] =
                                                            false;
                                                        selectedGenderFam[1] =
                                                            true;
                                                        gendFamily = 'her';
                                                      }
                                                    }
                                                  },
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 20),
                                        child: Text(
                                          'Obituary text:',
                                          style: TextStyle(
                                            color: mfLettersColor,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: TextField(
                                          controller: _controllerFromTheFamily,
                                          style: TextStyle(
                                              color: mfThrirdLetterColor),
                                          readOnly: true,
                                          maxLines: null,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                          ),
                                          textAlign: TextAlign.justify,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              else if (_chosenValue == 'From the deceased')
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                      child: Text(
                                        'Obituary text:',
                                        style: TextStyle(
                                          color: mfLettersColor,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 15),
                                      child: TextField(
                                        controller: _controllerFromTheDeceased,
                                        style: TextStyle(
                                            color: mfThrirdLetterColor),
                                        readOnly: true,
                                        maxLines: null,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                        ),
                                        textAlign: TextAlign.justify,
                                      ),
                                    ),
                                  ],
                                )
                              else if (_chosenValue == 'Sudden passing')
                                Padding(
                                  padding: const EdgeInsets.only(top: 15),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextField(
                                        controller: _controllerFullName,
                                        keyboardType: TextInputType.multiline,
                                        maxLines: null,
                                        textInputAction: TextInputAction.done,
                                        decoration: InputDecoration(
                                          labelText: 'Provide your full name',
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: mfLightGrey,
                                            ),
                                            borderRadius:
                                                const BorderRadius.all(
                                              const Radius.circular(7),
                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.black26,
                                            ),
                                            borderRadius:
                                                const BorderRadius.all(
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
                                                color: mfPrimaryColor,
                                                width: 2.0),
                                            borderRadius:
                                                BorderRadius.circular(7.0),
                                          ),
                                        ),
                                        onSubmitted: (value) {
                                          setState(() {
                                            _controllerFullName.text = value;
                                            sudden4 = _controllerFullName.text;
                                          });
                                        },
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 15),
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              1.5,
                                          child: CheckboxListTile(
                                            activeColor: mfPrimaryColor,
                                            contentPadding: EdgeInsets.all(0),
                                            title: Text(
                                              'Use \"As a family / we are\"',
                                              style: TextStyle(
                                                color: mfThrirdLetterColor,
                                                fontSize: 14,
                                              ),
                                              textAlign: TextAlign.left,
                                            ),
                                            value: checkedValueSud,
                                            onChanged: (newValue) {
                                              setState(() {
                                                checkedValueSud = newValue;
                                                if (checkedValueSud) {
                                                  sudden1 = 'We are';
                                                  sudden2 =
                                                      'as a family have decided to honor our';
                                                  sudden3 = 'we';
                                                  sudden4 =
                                                      'The Family of ${widget.fundDetails.firstName}${widget.fundDetails.nickName == null ? '' : ' ' + widget.fundDetails.nickName}${widget.fundDetails.middleName == null ? '' : ' ' + widget.fundDetails.middleName} ${widget.fundDetails.lastName}';
                                                } else {
                                                  sudden1 = 'I am';
                                                  sudden2 = 'I';
                                                  sudden3 = 'I';
                                                  sudden4 =
                                                      _controllerFullName.text;
                                                }
                                              });
                                            },
                                            controlAffinity:
                                                ListTileControlAffinity.leading,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 15, bottom: 15),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Deseased Gender',
                                              style: TextStyle(
                                                color: mfThrirdLetterColor,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            ToggleButtons(
                                              isSelected: selectedGenderSud,
                                              selectedColor: Colors.white,
                                              color: mfLightGrey,
                                              fillColor: mfPrimaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                              constraints: BoxConstraints(
                                                minHeight: 30,
                                                minWidth: 90,
                                              ),
                                              children: [
                                                Text('Male'),
                                                Text('Female'),
                                              ],
                                              onPressed: (int newIndex) {
                                                setState(
                                                  () {
                                                    for (int index = 0;
                                                        index <
                                                            selectedGenderSud
                                                                .length;
                                                        index++) {
                                                      if (newIndex == 0) {
                                                        selectedGenderSud[0] =
                                                            true;
                                                        selectedGenderSud[1] =
                                                            false;
                                                        gendSudden = 'him';
                                                      } else {
                                                        selectedGenderSud[0] =
                                                            false;
                                                        selectedGenderSud[1] =
                                                            true;
                                                        gendSudden = 'her';
                                                      }
                                                    }
                                                  },
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 20),
                                        child: Text(
                                          'Obituary text:',
                                          style: TextStyle(
                                            color: mfLettersColor,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: TextField(
                                          controller: _controllerSuddenPassing,
                                          style: TextStyle(
                                              color: mfThrirdLetterColor),
                                          readOnly: true,
                                          maxLines: null,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                          ),
                                          textAlign: TextAlign.justify,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              else if (_chosenValue ==
                                  'Accident / Tragedy / Event')
                                Padding(
                                  padding: const EdgeInsets.only(top: 15),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextField(
                                        controller: _controllerFullName,
                                        keyboardType: TextInputType.multiline,
                                        maxLines: null,
                                        textInputAction: TextInputAction.done,
                                        decoration: InputDecoration(
                                          labelText: 'Provide your full name',
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: mfLightGrey,
                                            ),
                                            borderRadius:
                                                const BorderRadius.all(
                                              const Radius.circular(7),
                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.black26,
                                            ),
                                            borderRadius:
                                                const BorderRadius.all(
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
                                                color: mfPrimaryColor,
                                                width: 2.0),
                                            borderRadius:
                                                BorderRadius.circular(7.0),
                                          ),
                                        ),
                                        onSubmitted: (value) {
                                          setState(() {
                                            _controllerFullName.text = value;
                                            aTE2 = _controllerFullName.text;
                                          });
                                        },
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 15),
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  1.5,
                                              child: CheckboxListTile(
                                                activeColor: mfPrimaryColor,
                                                contentPadding:
                                                    EdgeInsets.all(0),
                                                title: Text(
                                                  'Use \"As a family / we are\"',
                                                  style: TextStyle(
                                                    color: mfThrirdLetterColor,
                                                    fontSize: 14,
                                                  ),
                                                  textAlign: TextAlign.left,
                                                ),
                                                value: checkedValueATE,
                                                onChanged: (newValue) {
                                                  setState(() {
                                                    checkedValueATE = newValue;
                                                    if (checkedValueATE) {
                                                      aTE1 = 'we';
                                                      aTE2 =
                                                          'The Family of ${widget.fundDetails.firstName}${widget.fundDetails.nickName == null ? '' : ' ' + widget.fundDetails.nickName}${widget.fundDetails.middleName == null ? '' : ' ' + widget.fundDetails.middleName} ${widget.fundDetails.lastName}';
                                                    } else {
                                                      aTE1 = 'I';
                                                      aTE2 = _controllerFullName
                                                          .text;
                                                    }
                                                  });
                                                },
                                                controlAffinity:
                                                    ListTileControlAffinity
                                                        .leading,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 15, bottom: 15),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Deseased Gender',
                                              style: TextStyle(
                                                color: mfThrirdLetterColor,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            ToggleButtons(
                                              isSelected: selectedGenderATE,
                                              selectedColor: Colors.white,
                                              color: mfLightGrey,
                                              fillColor: mfPrimaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                              constraints: BoxConstraints(
                                                minHeight: 30,
                                                minWidth: 90,
                                              ),
                                              children: [
                                                Text('Male'),
                                                Text('Female'),
                                              ],
                                              onPressed: (int newIndex) {
                                                setState(
                                                  () {
                                                    for (int index = 0;
                                                        index <
                                                            selectedGenderATE
                                                                .length;
                                                        index++) {
                                                      if (newIndex == 0) {
                                                        selectedGenderATE[0] =
                                                            true;
                                                        selectedGenderATE[1] =
                                                            false;
                                                        aTegend1 = 'man';
                                                        aTegend2 = 'His';
                                                      } else {
                                                        selectedGenderATE[0] =
                                                            false;
                                                        selectedGenderATE[1] =
                                                            true;
                                                        aTegend1 = 'woman';
                                                        aTegend2 = 'Her';
                                                      }
                                                    }
                                                  },
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(top: 15),
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Occured in',
                                              style: TextStyle(
                                                color: mfThrirdLetterColor,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            buildRadios(),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 20, bottom: 8),
                                        child: GestureDetector(
                                          onTap: () =>
                                              _selectedATEDate(context),
                                          child: AbsorbPointer(
                                            child: TextFormField(
                                              style: TextStyle(
                                                  color: mfPrimaryColor),
                                              controller:
                                                  _selectedDateController,
                                              decoration: InputDecoration(
                                                labelText:
                                                    'Please enter a date.',
                                                icon: Icon(
                                                  Icons.calendar_today,
                                                ),
                                                enabledBorder: InputBorder.none,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 20),
                                        child: Text(
                                          'Obituary text:',
                                          style: TextStyle(
                                            color: mfLettersColor,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: TextField(
                                          controller: _controllerATE,
                                          style: TextStyle(
                                              color: mfThrirdLetterColor),
                                          readOnly: true,
                                          maxLines: null,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                          ),
                                          textAlign: TextAlign.justify,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                      ],
                    ),
                  ],
                ),
              ),
              Theme(
                data: Theme.of(context)
                    .copyWith(dividerColor: Colors.transparent),
                child: ExpansionTile(
                  textColor: mfPrimaryColor,
                  tilePadding: EdgeInsets.zero,
                  childrenPadding: EdgeInsets.only(top: 5),
                  title: Text('Edit funeral service:'),
                  children: [
                    TextField(
                      controller: _venueNameController,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        hintText: _venueNameController.text,
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
                          borderSide: const BorderSide(
                              color: mfPrimaryColor, width: 2.0),
                          borderRadius: BorderRadius.circular(7.0),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: TextField(
                        controller: _venuePhoneController,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintText: _venuePhoneController.text,
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
                            borderSide: const BorderSide(
                                color: mfPrimaryColor, width: 2.0),
                            borderRadius: BorderRadius.circular(7.0),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15, bottom: 15),
                      child: TextField(
                        controller: _venueAddressController,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintText: _venueAddressController.text,
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
                            borderSide: const BorderSide(
                                color: mfPrimaryColor, width: 2.0),
                            borderRadius: BorderRadius.circular(7.0),
                          ),
                        ),
                      ),
                    ),
                    TextField(
                      controller: _venueCityController,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        hintText: _venueCityController.text,
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
                          borderSide: const BorderSide(
                              color: mfPrimaryColor, width: 2.0),
                          borderRadius: BorderRadius.circular(7.0),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15, bottom: 15),
                      child: TextField(
                        controller: _venueStateController,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintText: _venueStateController.text,
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
                            borderSide: const BorderSide(
                                color: mfPrimaryColor, width: 2.0),
                            borderRadius: BorderRadius.circular(7.0),
                          ),
                        ),
                      ),
                    ),
                    TextField(
                      controller: _venueZipController,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        hintText: _venueZipController.text,
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
                          borderSide: const BorderSide(
                              color: mfPrimaryColor, width: 2.0),
                          borderRadius: BorderRadius.circular(7.0),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => _selectServiceDate(context),
                      child: AbsorbPointer(
                        child: TextFormField(
                          style: TextStyle(color: mfPrimaryColor),
                          controller: _venueDateController,
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
                    TextField(
                      controller: _venueTimeController,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        hintText: _venueTimeController.text,
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
                          borderSide: const BorderSide(
                              color: mfPrimaryColor, width: 2.0),
                          borderRadius: BorderRadius.circular(7.0),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15, bottom: 15),
                      child: TextField(
                        controller: _venueLiveWebController,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintText: _venueLiveWebController.text,
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
                            borderSide: const BorderSide(
                                color: mfPrimaryColor, width: 2.0),
                            borderRadius: BorderRadius.circular(7.0),
                          ),
                        ),
                      ),
                    ),
                    TextField(
                      controller: _venueAddInfoController,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        hintText: _venueAddInfoController.text,
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
                          borderSide: const BorderSide(
                              color: mfPrimaryColor, width: 2.0),
                          borderRadius: BorderRadius.circular(7.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 5),
                child: ElevatedButton(
                  child: Text(
                    'Publish Changes',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    alignment: Alignment.bottomCenter,
                    primary: mfPrimaryColor,
                    shadowColor: mfPrimaryColor,
                    elevation: 5,
                    padding: EdgeInsets.symmetric(horizontal: 35, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                  onPressed: () {
                    if (i == 0) {
                      widget.fundDetails.draft = false;
                    } else {
                      widget.fundDetails.draft = true;
                    }
                    if (widget.fundDetails.firstName != _firstName.text) {
                      widget.fundDetails.firstName = _firstName.text;
                    }
                    if (widget.fundDetails.nickName != _nickName.text &&
                        _nickName.text.isNotEmpty) {
                      widget.fundDetails.nickName = _nickName.text;
                    }
                    if (widget.fundDetails.middleName != _middleName.text &&
                        _middleName.text.isNotEmpty) {
                      widget.fundDetails.middleName = _middleName.text;
                    }
                    if (widget.fundDetails.lastName != _lastName.text) {
                      widget.fundDetails.lastName = _lastName.text;
                    }
                    if (widget.fundDetails.goalAmount != _goalAmount.text) {
                      widget.fundDetails.goalAmount =
                          double.parse(_goalAmount.text);
                    }
                    if (pickedBDate != null) {
                      widget.fundDetails.birthDate = pickedBDate.toString();
                    }
                    if (pickedPDate != null) {
                      widget.fundDetails.passingDate = pickedPDate.toString();
                    }
                    if (pickedEDate != null) {
                      widget.fundDetails.expirationDate =
                          pickedEDate.toString();
                    }
                    if (imageFile != null) {
                      widget.fundDetails.image =
                          basename(imageFile.path).toString();
                      widget.fundDetails.image64 = base64Encode(bytes);
                    }
                    // if (widget.fundDetails.venueName !=
                    //     _venueNameController.text) {
                    //   widget.fundDetails.venueName = _venueNameController.text;
                    // }
                    widget.fundDetails.venueName = _venueNameController.text;
                    widget.fundDetails.venuePhoneNumber =
                        _venuePhoneController.text;
                    widget.fundDetails.venueAddress =
                        _venueAddressController.text;
                    widget.fundDetails.venueCity = _venueCityController.text;
                    widget.fundDetails.venueState = _venueStateController.text;
                    widget.fundDetails.venueZipCode = _venueZipController.text;
                    widget.fundDetails.venueTime = _venueTimeController.text;
                    if (pickedServiceDate != null) {
                      widget.fundDetails.venueDate =
                          pickedServiceDate.toString();
                    }
                    widget.fundDetails.liveWebcast =
                        _venueLiveWebController.text;
                    widget.fundDetails.venueAdditionalInfo =
                        _venueAddInfoController.text;
                    if (writenByYou) {
                      widget.fundDetails.fundContent =
                          _controllerWritenByYou.text;
                      widget.fundDetails.template = false;
                      widget.fundDetails.templateOptions = null;
                    } else {
                      if (_controllerFullName.text.isNotEmpty &&
                          _controllerFullName.text != null) {
                        widget.fundDetails.authorname =
                            _controllerFullName.text;
                      }
                      if (_chosenValue == 'Default Template') {
                        widget.fundDetails.fundContent = null;
                        widget.fundDetails.template = true;
                        widget.fundDetails.eventTime = null;
                        widget.fundDetails.eventDate = null;
                        widget.fundDetails.textSelection = 1;
                        if (gend == 'him') {
                          widget.fundDetails.gender = 'male';
                        } else {
                          widget.fundDetails.gender = 'female';
                        }
                      } else if (_chosenValue == 'From the family') {
                        widget.fundDetails.fundContent = null;
                        widget.fundDetails.template = true;
                        widget.fundDetails.eventTime = null;
                        widget.fundDetails.eventDate = null;
                        widget.fundDetails.author = checkedValueFam;
                        widget.fundDetails.textSelection = 2;
                        if (gendFamily == 'him') {
                          widget.fundDetails.gender = 'male';
                        } else {
                          widget.fundDetails.gender = 'female';
                        }
                      } else if (_chosenValue == 'From the deceased') {
                        widget.fundDetails.fundContent = null;
                        widget.fundDetails.template = true;
                        widget.fundDetails.eventTime = null;
                        widget.fundDetails.eventDate = null;
                        widget.fundDetails.textSelection = 3;
                        widget.fundDetails.gender = null;
                      } else if (_chosenValue == 'Sudden passing') {
                        widget.fundDetails.author = checkedValueSud;
                        widget.fundDetails.textSelection = 4;
                        if (gendSudden == 'him') {
                          widget.fundDetails.gender = 'male';
                        } else {
                          widget.fundDetails.gender = 'female';
                        }
                      } else if (_chosenValue == 'Accident / Tragedy / Event') {
                        widget.fundDetails.fundContent = null;
                        widget.fundDetails.template = true;
                        widget.fundDetails.eventTime = null;
                        widget.fundDetails.eventDate = null;
                        widget.fundDetails.textSelection = 5;
                        widget.fundDetails.author = checkedValueATE;
                        if (aTegend1 == 'man') {
                          widget.fundDetails.gender = 'male';
                        } else {
                          widget.fundDetails.gender = 'female';
                        }
                        if (occured == 'early morning hours') {
                          widget.fundDetails.eventTime = 'morning';
                        } else if (occured == 'late evening hours') {
                          widget.fundDetails.eventTime = 'evening';
                        }
                        widget.fundDetails.eventDate = pickedATEDate.toString();
                      }
                    }
                    Provider.of<Fundraisers>(context, listen: false)
                        .editFundraiser(widget.fundDetails);
                    Navigator.of(context)
                        .pushReplacementNamed(TabsScreen.routeName);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
