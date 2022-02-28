import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mfapp_mobile/bin/my_flutter_app_icons.dart';

import '../../bin/colors.dart';
import '../../providers/fundraiser_details.dart';

class EditObituary extends StatefulWidget {
  FundraiserDetails data;
  EditObituary({this.data});
  @override
  _EditObituaryState createState() => _EditObituaryState();
}

class _EditObituaryState extends State<EditObituary> {
  List<String> templateList = [
    'Default Template',
    'From the family',
    'From the deceased',
    'Sudden passing',
    'Accident / Tragedy / Event',
  ];
  List<bool> isSelected = [true, false];
  List<bool> selectedGender = [true, false];
  List<bool> selectedGenderFam = [true, false];
  List<bool> selectedGenderSud = [true, false];
  List<bool> selectedGenderATE = [true, false];
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
  String _chosenValue = 'Default Template';
  static const values = <String>['morning', 'evening'];
  String selectedValue = values.first;
  final _controllerWritenByYou = TextEditingController();
  final _controllerFullName = TextEditingController();
  final _controllerDefaultTemplate = TextEditingController();
  final _controllerFromTheFamily = TextEditingController();
  final _controllerFromTheDeceased = TextEditingController();
  final _controllerSuddenPassing = TextEditingController();
  final _controllerATE = TextEditingController();
  TextEditingController _selectedDateController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  String occured = 'early morning hours';

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
            '${picked.toLocal().day}/${picked.toLocal().month}/${picked.toLocal().year}';
        _selectedDateController.text = date;
      });
  }

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

  @override
  Widget build(BuildContext context) {
    DateFormat formatter = DateFormat('yMMMMEEEEd');
    String formatted = formatter.format(selectedDate);
    _controllerDefaultTemplate.text =
        'The ${widget.data.lastName} family is deeply saddened to announce the passing of ${widget.data.firstName} and offers a special way to honor $gend.\n\nIn lieu of flowers, food, sympathy cards or charitable donations the family is requesting donations by clicking on the \'Donate Now\' button in order to allow those who loved and knew $gend the answer to the question...\“Is there anything I can do?\”.\n\nWhile donating you will be able to offer your condolences by writing a message which will appear below as well as choose to remain anonymous.\n\nAll donations are directly deposited to ${widget.data.location.locationName} for complete transparency & security.\n\n${widget.data.location.locationName} has been entrusted with funeral arrangements.';
    _controllerFromTheFamily.text =
        '$fromTheFamily1 deeply saddened to announce the passing of my beloved ${widget.data.firstName} ${widget.data.lastName} and have decided to honor $gendFamily by having a memorial fundraiser. In lieu of flowers, food or charitable donations, your contribution will be greatly appreciated and $fromTheFamily2 thank you in advance. In order to donate, please click on the \'Donate Now\' button. All donations are directly deposited to the funeral home for complete transparency & security. While donating you will be able to write a message, offer your condolences, as well as choose to have your name or contribution anonymous.\n\nIf you are unable to donate then $fromTheFamily2 ask that you please click and \"Share this Fundraiser\" located under the Donate section. The success of the fundraiser depends on how well it is shared to all social media platforms, email and text.\n\nWarmest Regards and Greatly Appreciated,\n\n$fromTheFamily3';
    _controllerFromTheDeceased.text =
        '"Hello Family and Friends. I want to thank everyone for their thoughts and prayers. I know my family and friends will miss me dearly, but this is not goodbye, this is... ‘we will meet again’. Until then, I would truly appreciate, and ask in lieu of flowers, food or charitable donations, that a contribution be made to my fundraiser and... I thank you in advance. In order to donate, please click on the \'Donate\' button. All donations are directly deposited to the funeral home for complete transparency & security. While donating you will be able to write a message, offer your condolences as well as choose to have your name or contribution amount remain anonymous.\n\nIf you are unable to donate then I ask that you please click on the ‘Share This Fundraiser’ button located under the ‘Donate Now’ button. The success of the fundraiser depends on how well it is shared to all social media platforms, email and text.\n\nMay my smile forever stay within your heart.\n\n${widget.data.firstName}${widget.data.nickName == null ? '' : ' ' + widget.data.nickName}${widget.data.middleName == null ? '' : ' ' + widget.data.middleName} ${widget.data.lastName}';
    _controllerSuddenPassing.text =
        '$sudden1 deeply saddened to announce the sudden passing of our beloved ${widget.data.firstName} ${widget.data.lastName}. With this passing being so sudden, $sudden2 ${widget.data.firstName} by having a memorial fundraiser. In lieu of flowers, food or charitable donations, your contribution will be greatly appreciated and $sudden3 thank you in advance. In order to donate, please click on the \'Donate Now\' button. All donations are directly deposited to the funeral home for complete transparency & security. While donating you will be able to write a message, offer your condolences, as well as choose to have your name or contribution anonymous.\n\nIf you are unable to donate then $sudden3 ask that you please click and "Share this Fundraiser" located under the Donate section. The success of the fundraiser depends on how well it is shared to all social media platforms, email and text.\n\nWarmest Regards and Greatly Appreciated,\n\n$sudden4';
    _controllerATE.text =
        'In the $occured of $formatted my family and I suffered a major loss. ${widget.data.firstName} was an amazing $aTegend1 loved by many and will be missed by all. $aTegend2 untimely passing has left us with many unexpected financial burdens. $aTE1 have decided to honor my ${widget.data.firstName} by having a memorial fundraiser. In lieu of flowers, food or charitable donations, your contribution will be greatly appreciated and $aTE1 thank you in advance. In order to donate, please click on the \'Donate Now\' button. All donations are directly deposited to the funeral home for complete transparency & security. While donating you will be able to write a message, offer your condolences, as well as choose to have your name or contribution anonymous.\n\n If you are unable to donate then $aTE1 ask that you please click and "Share this Fundraiser" located under the Donate section. The success of the fundraiser depends on how well it is shared to all social media platforms, email and text.\n\nWarmest Regards and Greatly Appreciated,\n\n$aTE2';
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 15),
              alignment: Alignment.center,
              child: ToggleButtons(
                isSelected: isSelected,
                selectedColor: Colors.white,
                color: mfLightGrey,
                fillColor: mfPrimaryColor,
                borderRadius: BorderRadius.circular(6),
                constraints: BoxConstraints(
                    minHeight: 30,
                    minWidth: (MediaQuery.of(context).size.width - 36) / 2),
                children: [
                  Text('Use one of our Templates'),
                  Text('Write the Obituary'),
                ],
                onPressed: (int newIndex) {
                  setState(
                    () {
                      for (int index = 0; index < isSelected.length; index++) {
                        if (newIndex == 0) {
                          isSelected[0] = true;
                          isSelected[1] = false;
                          writenByYou = false;
                        } else {
                          isSelected[0] = false;
                          isSelected[1] = true;
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
                    padding: const EdgeInsets.only(top: 20, bottom: 20),
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
                      width: MediaQuery.of(context).size.width,
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
                            width: MediaQuery.of(context).size.width / 1.35,
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
                                  //elevation: 5,
                                  style: TextStyle(color: Colors.white),
                                  iconEnabledColor: mfLettersColor,
                                  iconSize: 30,
                                  items: templateList
                                      .map<DropdownMenuItem<String>>(
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
                          padding: const EdgeInsets.only(top: 15, bottom: 15),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                borderRadius: BorderRadius.circular(6),
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
                                          index < selectedGender.length;
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
                            style: TextStyle(color: mfThrirdLetterColor),
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
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                            onSubmitted: (value) {
                              setState(() {
                                _controllerFullName.text = value;
                                fromTheFamily3 = _controllerFullName.text;
                              });
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: Container(
                              width: MediaQuery.of(context).size.width / 1.5,
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
                                      fromTheFamily1 = 'As a family we are';
                                      fromTheFamily2 = 'we';
                                      fromTheFamily3 =
                                          'The Family of ${widget.data.firstName}${widget.data.nickName == null ? '' : ' ' + widget.data.nickName}${widget.data.middleName == null ? '' : ' ' + widget.data.middleName} ${widget.data.lastName}';
                                    } else {
                                      fromTheFamily1 = 'I am';
                                      fromTheFamily2 = 'I';
                                      fromTheFamily3 = _controllerFullName.text;
                                    }
                                  });
                                },
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15, bottom: 15),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  borderRadius: BorderRadius.circular(6),
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
                                            index < selectedGenderFam.length;
                                            index++) {
                                          if (newIndex == 0) {
                                            selectedGenderFam[0] = true;
                                            selectedGenderFam[1] = false;
                                            gendFamily = 'him';
                                          } else {
                                            selectedGenderFam[0] = false;
                                            selectedGenderFam[1] = true;
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
                              style: TextStyle(color: mfThrirdLetterColor),
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
                            style: TextStyle(color: mfThrirdLetterColor),
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
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                              width: MediaQuery.of(context).size.width / 1.5,
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
                                          'The Family of ${widget.data.firstName}${widget.data.nickName == null ? '' : ' ' + widget.data.nickName}${widget.data.middleName == null ? '' : ' ' + widget.data.middleName} ${widget.data.lastName}';
                                    } else {
                                      sudden1 = 'I am';
                                      sudden2 = 'I';
                                      sudden3 = 'I';
                                      sudden4 = _controllerFullName.text;
                                    }
                                  });
                                },
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15, bottom: 15),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  borderRadius: BorderRadius.circular(6),
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
                                            index < selectedGenderSud.length;
                                            index++) {
                                          if (newIndex == 0) {
                                            selectedGenderSud[0] = true;
                                            selectedGenderSud[1] = false;
                                            gendSudden = 'him';
                                          } else {
                                            selectedGenderSud[0] = false;
                                            selectedGenderSud[1] = true;
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
                              style: TextStyle(color: mfThrirdLetterColor),
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
                  else if (_chosenValue == 'Accident / Tragedy / Event')
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                            onSubmitted: (value) {
                              setState(() {
                                _controllerFullName.text = value;
                                aTE2 = _controllerFullName.text;
                              });
                            },
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 15),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width / 1.5,
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
                                    value: checkedValueATE,
                                    onChanged: (newValue) {
                                      setState(() {
                                        checkedValueATE = newValue;
                                        if (checkedValueATE) {
                                          aTE1 = 'we';
                                          aTE2 =
                                              'The Family of ${widget.data.firstName}${widget.data.nickName == null ? '' : ' ' + widget.data.nickName}${widget.data.middleName == null ? '' : ' ' + widget.data.middleName} ${widget.data.lastName}';
                                        } else {
                                          aTE1 = 'I';
                                          aTE2 = _controllerFullName.text;
                                        }
                                      });
                                    },
                                    controlAffinity:
                                        ListTileControlAffinity.leading,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15, bottom: 15),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  borderRadius: BorderRadius.circular(6),
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
                                            index < selectedGenderATE.length;
                                            index++) {
                                          if (newIndex == 0) {
                                            selectedGenderATE[0] = true;
                                            selectedGenderATE[1] = false;
                                            aTegend1 = 'man';
                                            aTegend2 = 'His';
                                          } else {
                                            selectedGenderATE[0] = false;
                                            selectedGenderATE[1] = true;
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
                            width: MediaQuery.of(context).size.width / 2,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                            padding: const EdgeInsets.only(top: 20, bottom: 8),
                            child: GestureDetector(
                              onTap: () => _selectBDate(context),
                              child: AbsorbPointer(
                                child: TextFormField(
                                  style: TextStyle(color: mfPrimaryColor),
                                  controller: _selectedDateController,
                                  decoration: InputDecoration(
                                    labelText: 'Please enter a date.',
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
                              style: TextStyle(color: mfThrirdLetterColor),
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
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: ElevatedButton(
                child: Text(
                  'Complete Obituary',
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
                  if (writenByYou) {
                    widget.data.fundContent = _controllerWritenByYou.text;
                    widget.data.template = false;
                  } else {
                    widget.data.fundContent = null;
                    widget.data.template = true;
                    widget.data.eventTime = null;
                    widget.data.eventDate = null;
                    widget.data.authorname = _controllerFullName.text;
                    if (_chosenValue == 'Default Template') {
                      widget.data.textSelection = 1;
                      if (gend == 'him') {
                        widget.data.gender = 'male';
                      } else {
                        widget.data.gender = 'female';
                      }
                    } else if (_chosenValue == 'From the family') {
                      widget.data.author = checkedValueFam;
                      widget.data.textSelection = 2;
                      if (gendFamily == 'him') {
                        widget.data.gender = 'male';
                      } else {
                        widget.data.gender = 'female';
                      }
                    } else if (_chosenValue == 'From the deceased') {
                      widget.data.textSelection = 3;
                      widget.data.gender = null;
                    } else if (_chosenValue == 'Sudden passing') {
                      widget.data.author = checkedValueSud;
                      widget.data.textSelection = 4;
                      if (gendSudden == 'him') {
                        widget.data.gender = 'male';
                      } else {
                        widget.data.gender = 'female';
                      }
                    } else if (_chosenValue == 'Accident / Tragedy / Event') {
                      widget.data.textSelection = 5;
                      widget.data.author = checkedValueATE;
                      if (aTegend1 == 'man') {
                        widget.data.gender = 'male';
                      } else {
                        widget.data.gender = 'female';
                      }
                      if (occured == 'early morning hours') {
                        widget.data.eventTime = 'morning';
                      } else if (occured == 'late evening hours') {
                        widget.data.eventTime = 'evening';
                      }
                      widget.data.eventDate = selectedDate.toString();
                    }
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
