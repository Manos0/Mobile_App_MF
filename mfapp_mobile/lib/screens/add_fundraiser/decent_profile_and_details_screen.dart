import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:mfapp_mobile/screens/dashboard_screen.dart';

import '../../bin/colors.dart';
import '../../widgets/add_fundraiser/decented_info/selected_location_widget.dart';
import '../../widgets/add_fundraiser/decented_info/text_input_form_widget.dart';
import '../../widgets/add_fundraiser/decented_info/date_input_form_widget.dart';

class DecentProfileAndDetailsScreen extends StatefulWidget {
  static const routeName = '/decent-profile-and-details';
  // const DecentProfileAndDetailsScreen({ Key? key }) : super(key: key);

  @override
  _DecentProfileAndDetailsScreenState createState() =>
      _DecentProfileAndDetailsScreenState();
}

class _DecentProfileAndDetailsScreenState
    extends State<DecentProfileAndDetailsScreen> {
  final _form = GlobalKey<FormState>();
  FocusNode _fName;
  FocusNode _nName;
  FocusNode _mName;
  FocusNode _lName;
  FocusNode _goalAmount;
  FocusNode _birthDay;
  FocusNode _passingDay;
  FocusNode _expireDay;
  String firstName;
  String nickName;
  String middleName;
  String lastName;
  double goalAmount;
  DateTime dateOfBirth;
  DateTime dateOfPassing;
  DateTime expirationDate;
  bool enableButton = false;
  Color buttonColor = Colors.red[500];

  @override
  void initState() {
    super.initState();
    _fName = FocusNode();
    _nName = FocusNode();
    _mName = FocusNode();
    _lName = FocusNode();
    _goalAmount = FocusNode();
    _birthDay = FocusNode();
    _passingDay = FocusNode();
    _expireDay = FocusNode();
  }

  @override
  void dispose() {
    _fName.dispose();
    _nName.dispose();
    _mName.dispose();
    _lName.dispose();
    _goalAmount.dispose();
    _birthDay.dispose();
    _passingDay.dispose();
    _expireDay.dispose();
    super.dispose();
  }

  void _saveForm() {
    _form.currentState.save();
    enableButton = true;
    setState(() {
      buttonColor = mfPrimaryColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    // String birth = DateFormat.yMMMMd().format(_dateTime);
    final locationName = ModalRoute.of(context).settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        title: Column(
          children: [
            Text(
              'Decedent Information',
              style: TextStyle(
                color: mfLettersColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'and fundraiser details',
              style: TextStyle(
                color: mfLettersColor,
                fontSize: 16,
                fontWeight: FontWeight.w200,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            highlightColor: mfLightGreen,
            splashColor: mfPrimaryColor40,
            icon: Icon(
              Icons.save,
              color: mfPrimaryColor,
            ),
            onPressed: _saveForm,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SelectedLocationWidget(locationName),
            Container(
              margin: EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Form(
                key: _form,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      TextInputWidget(
                        color: mfPrimaryColor,
                        data: firstName,
                        focus: _fName,
                        nextFocus: _nName,
                        text: 'First Name',
                      ),
                      TextInputWidget(
                        color: mfPrimaryColor,
                        data: nickName,
                        focus: _nName,
                        nextFocus: _mName,
                        text: 'Nick Name',
                      ),
                      TextInputWidget(
                        color: mfPrimaryColor,
                        data: middleName,
                        focus: _mName,
                        nextFocus: _lName,
                        text: 'Middle Name',
                      ),
                      TextInputWidget(
                        color: mfPrimaryColor,
                        data: lastName,
                        focus: _lName,
                        nextFocus: _birthDay,
                        text: 'Last Name',
                      ),
                      DateInputWidget(
                        color: mfPrimaryColor,
                        iconColor: mfLettersColor,
                        focus: _birthDay,
                        nextFocus: _passingDay,
                        data: dateOfBirth,
                        text: 'Date of Birth',
                      ),
                      DateInputWidget(
                        color: mfPrimaryColor,
                        iconColor: mfLettersColor,
                        focus: _passingDay,
                        nextFocus: _goalAmount,
                        data: dateOfPassing,
                        text: 'Date of Passing',
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: TextFormField(
                          focusNode: _goalAmount,
                          decoration: InputDecoration(
                            labelText: 'Fundraiser Goal Amount',
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: mfPrimaryColor),
                            ),
                          ),
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                          onFieldSubmitted: (goalAmount) {
                            print(goalAmount);
                            _goalAmount.unfocus();
                            FocusScope.of(context).requestFocus(_expireDay);
                          },
                        ),
                      ),
                      DateInputWidget(
                        color: mfPrimaryColor,
                        iconColor: mfLettersColor,
                        focus: _expireDay,
                        nextFocus: null,
                        data: expirationDate,
                        text: 'Fundraiser Expiration Date',
                      ),
                      Container(
                        margin: EdgeInsets.all(8),
                        alignment: Alignment.centerRight,
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: mfPrimaryColor40,
                          child: IconButton(
                            enableFeedback: true,
                            icon: Icon(
                              Icons.arrow_right_alt_sharp,
                              color: buttonColor,
                              size: 35,
                            ),
                            onPressed: () {
                              enableButton
                                  ? Navigator.pushNamed(
                                      context, DashboardScreen.routeName)
                                  : null;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
