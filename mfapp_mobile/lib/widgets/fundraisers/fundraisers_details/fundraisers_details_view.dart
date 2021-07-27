import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:intl/intl.dart';

import './story_widget.dart';
import './donations.dart';
import './funeral_services.dart';
import '../../../bin/functions.dart';
import '../../../bin/colors.dart';

class FundraisersDetailsView extends StatelessWidget {
  final data;
  FundraisersDetailsView(this.data);

  @override
  Widget build(BuildContext context) {
    DateTime birthDate = new DateFormat('yyyy-MM-dd').parse(data.birthDate);
    var birth = DateFormat.yMMMMd().format(birthDate);
    DateTime passingDate = new DateFormat('yyyy-MM-dd').parse(data.passingDate);
    var passing = DateFormat.yMMMMd().format(passingDate);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        titleSpacing: 2,
        leadingWidth: 35,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.black,
          ),
          alignment: Alignment.centerLeft,
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          (data.firstName != null && data.firstName.length > 0
                  ? data.firstName
                  : '') +
              (data.nickName != null && data.nickName.length > 0
                  ? ' "' + data.nickName + '"'
                  : '') +
              (data.middleName != null && data.middleName.length > 0
                  ? ' ' + data.middleName
                  : '') +
              (data.lastName != null && data.lastName.length > 0
                  ? ' ' + data.lastName
                  : ''),
          style: TextStyle(
            color: mfLettersColor,
            fontFamily: 'Poppins',
            fontSize: 20,
          ),
          textAlign: TextAlign.center,
          softWrap: true,
          maxLines: 2,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 23, right: 23),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 8, bottom: 8),
                child: CircularPercentIndicator(
                  radius: 130,
                  lineWidth: 10,
                  percent: fundPercentage(data.fundRaised, data.goalAmount),
                  animation: true,
                  animationDuration: 600,
                  center: fundDetailImage(data.clientAvatarMD),
                  backgroundColor: Colors.grey[200],
                  circularStrokeCap: CircularStrokeCap.round,
                  progressColor: mfLightBlueColor,
                ),
                width: 130,
                height: 130,
              ),
              Text('$birth - $passing'),
              Container(
                margin: EdgeInsets.only(top: 8, bottom: 40),
                padding:
                    EdgeInsets.only(top: 8, bottom: 8, left: 20, right: 20),
                width: MediaQuery.of(context).size.width,
                decoration: new BoxDecoration(
                  borderRadius: new BorderRadius.circular(13.0),
                  color: mfLightGreen,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          '\$${data.fundRaised.toStringAsFixed(0)} ',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontFamily: 'Poppins',
                            fontSize: 13,
                          ),
                        ),
                        Text(
                          'Raised of \$${data.goalAmount.toStringAsFixed(0)}',
                          style: TextStyle(
                            color: Color.fromRGBO(128, 128, 128, 1),
                            fontFamily: 'Poppins',
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '${(fundPercentage(data.fundRaised, data.goalAmount) * 100).toStringAsFixed(2)}%',
                      style: TextStyle(
                        color: Color.fromRGBO(128, 128, 128, 1),
                        fontFamily: 'Poppins',
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 30),
                child: Column(
                  children: [
                    if (data.fundContent != null)
                      StoryWidget(content: data.fundContent),
                    FuneralServicesWidget(
                      locationName: data.location.locationName,
                      locationAddress1: data.location.locationAddress1,
                      locationEmail: data.location.locationEmail,
                      locationPhone: data.location.locationPhone,
                      locationCity: data.location.locationCity,
                      locationPostal: data.location.locationPostalCode,
                    ),
                  ],
                ),
              ),
              // Container(
              //   alignment: Alignment.centerLeft,
              //   margin: EdgeInsets.only(bottom: 30),
              //   child: Text(
              //     'Donations',
              //     style: TextStyle(
              //         color: mfLettersColor,
              //         fontSize: 16,
              //         fontWeight: FontWeight.w600),
              //   ),
              // ),
              if (data.payment.length > 0) Donations(data),
            ],
          ),
        ),
      ),
    );
  }
}
