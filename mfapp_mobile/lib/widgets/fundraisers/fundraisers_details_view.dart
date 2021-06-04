import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:readmore/readmore.dart';

import './fundraisers_details/donations.dart';
import '../../bin/functions.dart';
import '../../bin/colors.dart';

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
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.black,
          ),
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
          textAlign: TextAlign.left,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 23, right: 23),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 5),
                child: CircularPercentIndicator(
                  radius: 130,
                  lineWidth: 10,
                  percent: fundPercentage(data.fundRaised, data.goalAmount),
                  animation: true,
                  animationDuration: 600,
                  center: fundDetailImage(data.clientAvatarMD),
                  backgroundColor: Colors.grey[200],
                  circularStrokeCap: CircularStrokeCap.round,
                  progressColor: Theme.of(context).primaryColor,
                ),
                width: 130,
                height: 130,
              ),
              Text('${birth} - ${passing}'),
              Container(
                margin: EdgeInsets.only(top: 17, bottom: 30),
                width: MediaQuery.of(context).size.width,
                decoration: new BoxDecoration(
                  borderRadius: new BorderRadius.circular(13.0),
                  color: mfLightGreen,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 24),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Text(
                              '\$${data.fundRaised.toStringAsFixed(0)}',
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontFamily: 'Poppins',
                                fontSize: 16,
                              ),
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
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 24),
                      child: Text(
                        '${(fundPercentage(data.fundRaised, data.goalAmount) * 100).toStringAsFixed(2)}%',
                        style: TextStyle(
                          color: Color.fromRGBO(128, 128, 128, 1),
                          fontFamily: 'Poppins',
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 41),
                child: Column(
                  children: [
                    if (data.fundContent != null) // Extra
                      Column(
                        //Extra
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 20),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Story',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Poppins',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          ReadMoreText(
                            '${data.fundContent}',
                            style: TextStyle(
                              color: Color.fromRGBO(103, 107, 127, 1),
                              fontFamily: 'Poppins',
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.left,
                            trimCollapsedText: '  Show more',
                            trimExpandedText: ' Show less',
                            moreStyle:
                                TextStyle(fontSize: 16, color: mfPrimaryColor),
                            lessStyle:
                                TextStyle(fontSize: 16, color: mfPrimaryColor),
                            trimMode: TrimMode.Line,
                            trimLines: 5,
                            delimiter: '',
                          ),
                        ],
                      ),
                    Container(
                      alignment: Alignment.centerRight,
                      // margin: EdgeInsets.only(top: 41),
                      child: ElevatedButton.icon(
                        icon: Icon(
                          Icons.share_outlined,
                          color: Colors.white,
                          size: 23,
                        ),
                        label: Text(
                          'Share',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Poppins',
                            fontSize: 20,
                          ),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Color.fromRGBO(0, 219, 176, 1),
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                          ),
                          padding: MaterialStateProperty.all(
                              EdgeInsets.fromLTRB(25, 10, 25, 10)),
                        ),
                        onPressed: () {},
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 12),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Funeral Services',
                              style: TextStyle(
                                  color: mfSecondaryLetterColor,
                                  fontFamily: 'Poppins',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height / 3.5,
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.only(bottom: 20),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(13),
                                  topRight: Radius.circular(13),
                                  bottomLeft: Radius.circular(13),
                                  bottomRight: Radius.circular(13)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 7,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 35,
                                      width: 35,
                                      alignment: Alignment.center,
                                      margin:
                                          EdgeInsets.fromLTRB(20, 25, 12, 12),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Theme.of(context).primaryColor,
                                      ),
                                      child: new IconButton(
                                        padding: EdgeInsets.all(0),
                                        icon: new Icon(
                                          Icons.home_outlined,
                                          color: Colors.white,
                                        ),
                                        onPressed: null,
                                      ),
                                    ),
                                    Container(
                                      height: 35,
                                      margin: EdgeInsets.only(top: 12),
                                      alignment: Alignment.center,
                                      child: Text(
                                        '${data.location.locationName}',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Poppins',
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      height: 35,
                                      width: 35,
                                      alignment: Alignment.center,
                                      margin:
                                          EdgeInsets.fromLTRB(20, 0, 12, 12),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Theme.of(context).primaryColor,
                                      ),
                                      child: new IconButton(
                                          padding: EdgeInsets.all(0),
                                          icon: new Icon(
                                            Icons.location_on_outlined,
                                            color: Colors.white,
                                          ),
                                          onPressed: null),
                                    ),
                                    Container(
                                      height: 35,
                                      child: Text(
                                        '${data.location.locationAddress1}',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Poppins',
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      margin:
                                          EdgeInsets.fromLTRB(20, 6, 12, 15),
                                      child: ElevatedButton.icon(
                                        icon: Icon(
                                          Icons.message_outlined,
                                          color: Colors.white,
                                          size: 23,
                                        ),
                                        label: Text(
                                          'Message',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Poppins',
                                            fontSize: 15,
                                          ),
                                        ),
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                            Color.fromRGBO(0, 219, 176, 1),
                                          ),
                                          shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(40.0),
                                            ),
                                          ),
                                          padding: MaterialStateProperty.all(
                                              EdgeInsets.fromLTRB(
                                                  25, 10, 25, 10)),
                                        ),
                                        onPressed: () => launch(
                                            'mailto://${data.location.locationEmail}'),
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      margin: EdgeInsets.fromLTRB(0, 6, 12, 15),
                                      child: ElevatedButton.icon(
                                        icon: Icon(
                                          Icons.call_outlined,
                                          color: Colors.white,
                                          size: 23,
                                        ),
                                        label: Text(
                                          'Call',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Poppins',
                                            fontSize: 15,
                                          ),
                                        ),
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                            Color.fromRGBO(34, 206, 230, 1),
                                          ),
                                          shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(40.0),
                                            ),
                                          ),
                                          padding: MaterialStateProperty.all(
                                              EdgeInsets.fromLTRB(
                                                  25, 10, 25, 10)),
                                        ),
                                        onPressed: () => launch(
                                            'tel://${data.location.locationPhone}'),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
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
