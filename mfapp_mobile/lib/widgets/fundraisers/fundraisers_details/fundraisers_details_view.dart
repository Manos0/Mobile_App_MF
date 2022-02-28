import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:intl/intl.dart';

import './story_widget.dart';
import './donations.dart';
import './funeral_services.dart';
import '../../../providers/provider.dart';
import '../../../bin/functions.dart';
import '../../../bin/colors.dart';
import '../../edit_fundraiser/edit_fundraiser_grid.dart';
import '../../../providers/fundraiser_details.dart';

class FundraisersDetailsView extends StatelessWidget {
  FundraiserDetails data;
  FundraisersDetailsView(this.data);

  @override
  Widget build(BuildContext context) {
    int dateDifference;
    String _template;
    DateTime birthDate = new DateFormat('yyyy-MM-dd').parse(data.birthDate);
    var birth = DateFormat.yMMMMd().format(birthDate);
    DateTime passingDate = new DateFormat('yyyy-MM-dd').parse(data.passingDate);
    var passing = DateFormat.yMMMMd().format(passingDate);
    if (data.templateOptions != null) {
      if (data.textSelection == 1) {
        _template =
            'The ${data.lastName} family is deeply saddened to announce the passing of ${data.firstName} and offers a special way to honor ${data.gender == 'male' ? 'him' : 'her'}.\n\nIn lieu of flowers, food, sympathy cards or charitable donations the family is requesting donations by clicking on the \'Donate Now\' button in order to allow those who loved and knew ${data.gender == 'male' ? 'him' : 'her'} the answer to the question...\“Is there anything I can do?\”.\n\nWhile donating you will be able to offer your condolences by writing a message which will appear below as well as choose to remain anonymous.\n\nAll donations are directly deposited to ${data.location.locationName} for complete transparency & security.\n\n${data.location.locationName} has been entrusted with funeral arrangements.';
      } else if (data.textSelection == 2) {
        _template =
            '${data.author == true ? 'As a family we are' : 'I am'} deeply saddened to announce the passing of my beloved ${data.firstName} ${data.lastName} and have decided to honor ${data.gender == 'male' ? 'him' : 'her'} by having a memorial fundraiser. In lieu of flowers, food or charitable donations, your contribution will be greatly appreciated and ${data.author == true ? 'we' : 'I'} thank you in advance. In order to donate, please click on the \'Donate Now\' button. All donations are directly deposited to the funeral home for complete transparency & security. While donating you will be able to write a message, offer your condolences, as well as choose to have your name or contribution anonymous.\n\nIf you are unable to donate then ${data.author == true ? 'we' : 'I'} ask that you please click and \"Share this Fundraiser\" located under the Donate section. The success of the fundraiser depends on how well it is shared to all social media platforms, email and text.\n\nWarmest Regards and Greatly Appreciated,\n\n${data.author == true ? 'The Family of ${data.firstName} ${data.nickName == null ? '' : data.nickName} ${data.middleName == null ? '' : data.middleName} ${data.lastName}' : data.authorname}';
      } else if (data.textSelection == 3) {
        _template =
            '"Hello Family and Friends. I want to thank everyone for their thoughts and prayers. I know my family and friends will miss me dearly, but this is not goodbye, this is... ‘we will meet again’. Until then, I would truly appreciate, and ask in lieu of flowers, food or charitable donations, that a contribution be made to my fundraiser and... I thank you in advance. In order to donate, please click on the \'Donate\' button. All donations are directly deposited to the funeral home for complete transparency & security. While donating you will be able to write a message, offer your condolences as well as choose to have your name or contribution amount remain anonymous.\n\nIf you are unable to donate then I ask that you please click on the ‘Share This Fundraiser’ button located under the ‘Donate Now’ button. The success of the fundraiser depends on how well it is shared to all social media platforms, email and text.\n\nMay my smile forever stay within your heart.\n\n${data.firstName} ${data.nickName == null ? '' : data.nickName} ${data.middleName == null ? '' : data.middleName} ${data.lastName}';
      } else if (data.textSelection == 4) {
        _template =
            '${data.author == true ? 'We are' : 'I am'} deeply saddened to announce the sudden passing of our beloved ${data.firstName} ${data.lastName}. With this passing being so sudden, ${data.author == true ? 'as a family have decided to honor our' : 'I'} ${data.firstName} by having a memorial fundraiser. In lieu of flowers, food or charitable donations, your contribution will be greatly appreciated and ${data.author == true ? 'we' : 'I'} thank you in advance. In order to donate, please click on the \'Donate Now\' button. All donations are directly deposited to the funeral home for complete transparency & security. While donating you will be able to write a message, offer your condolences, as well as choose to have your name or contribution anonymous.\n\nIf you are unable to donate then ${data.author == true ? 'we' : 'I'} ask that you please click and "Share this Fundraiser" located under the Donate section. The success of the fundraiser depends on how well it is shared to all social media platforms, email and text.\n\nWarmest Regards and Greatly Appreciated,\n\n${data.author == true ? 'The Family of ${data.firstName} ${data.nickName == null ? '' : data.nickName} ${data.middleName == null ? '' : data.middleName} ${data.lastName}' : data.authorname}';
      } else {
        String formatted;
        if (data.eventDate != null) {
          DateFormat formatter = DateFormat('yMMMMEEEEd');
          formatted = formatter.format(DateTime.parse(data.eventDate));
        }
        _template =
            'In the ${data.eventTime == 'morning' ? 'early morning hours' : 'late evening hours'} of $formatted my family and I suffered a major loss. ${data.firstName} was an amazing ${data.gender == 'male' ? 'man' : 'woman'} loved by many and will be missed by all. ${data.gender == 'male' ? 'His' : 'Her'} untimely passing has left us with many unexpected financial burdens. ${data.author == true ? 'we' : 'I'} have decided to honor my ${data.firstName} by having a memorial fundraiser. In lieu of flowers, food or charitable donations, your contribution will be greatly appreciated and ${data.author == true ? 'we' : 'I'} thank you in advance. In order to donate, please click on the \'Donate Now\' button. All donations are directly deposited to the funeral home for complete transparency & security. While donating you will be able to write a message, offer your condolences, as well as choose to have your name or contribution anonymous.\n\n If you are unable to donate then ${data.author == true ? 'we' : 'I'} ask that you please click and "Share this Fundraiser" located under the Donate section. The success of the fundraiser depends on how well it is shared to all social media platforms, email and text.\n\nWarmest Regards and Greatly Appreciated,\n\n${data.author == true ? 'The Family of ${data.firstName} ${data.nickName == null ? '' : data.nickName} ${data.middleName == null ? '' : data.middleName} ${data.lastName}' : data.authorname}';
      }
    }
    if (data.payment.length > 0) {
      DateTime dateToday = DateTime.now();
      DateTime latestDonation =
          DateTime.parse(data.payment[0].paymentPaymentDate);
      dateDifference = dateToday.difference(latestDonation).inDays;
    }
    return Scaffold(
      backgroundColor: mfLightlightGrey,
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
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditFundraiserGrid(
                    fundDetails: data,
                  ),
                ),
              );
            },
            icon: Icon(
              Icons.edit,
              color: mfPrimaryColor,
            ),
          )
        ],
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
                margin: EdgeInsets.only(top: 25),
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('$birth - $passing'),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                padding: EdgeInsets.all(12),
                width: MediaQuery.of(context).size.width,
                decoration: new BoxDecoration(
                  borderRadius: new BorderRadius.circular(13.0),
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [mfLightBlueColor, mfLightBlueGradColor],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white.withOpacity(1),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: Offset(0, 1),
                    ),
                  ],
                  color: mfLightBlueColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          '\$${data.fundRaised.toStringAsFixed(0)} ',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Poppins',
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Raised of \$${data.goalAmount.toStringAsFixed(0)}',
                          style: TextStyle(
                            color: mfLightlightGrey,
                            fontFamily: 'Poppins',
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '${(fundPercentage(data.fundRaised, data.goalAmount) * 100).toStringAsFixed(2)}%',
                      style: TextStyle(
                        color: mfLightlightGrey,
                        fontFamily: 'Poppins',
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
              if (data.location.chargesEnabled == true &&
                  data.location.payoutsEnabled == true &&
                  dateDifference != null &&
                  dateDifference > 8 &&
                  data.closed == false)
                Container(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: () {
                      showCustomDialog(context, data);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: mfPrimaryColor,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                    ),
                    child: Text(
                      'Payout',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              if (data.template == false && data.fundContent != null)
                StoryWidget(content: data.fundContent)
              else if (data.template == true && data.templateOptions != null)
                StoryWidget(content: _template),
              FuneralServicesWidget(
                locationName: data.location.locationName,
                locationAddress1: data.location.locationAddress1,
                locationEmail: data.location.locationEmail,
                locationPhone: data.location.locationPhone,
                locationCity: data.location.locationCity,
                locationPostal: data.location.locationPostalCode,
              ),
              if (data.payment.length > 0) Donations(data),
            ],
          ),
        ),
      ),
    );
  }

  void showCustomDialog(BuildContext context, FundraiserDetails fundData) {
    bool _isLoading = false;
    showDialog(
      context: context,
      builder: (_) => Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        child: Padding(
          padding: EdgeInsets.only(bottom: 15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 15),
                padding: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.red[400],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(6),
                    topRight: Radius.circular(6),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.warning_amber,
                      size: 35,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              Text(
                'Attention',
                style: TextStyle(
                  color: mfLettersColor,
                  fontSize: 19,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 15),
                child: Text(
                  'This action is irreversible\nand will close the fundraiser!',
                  style: TextStyle(
                    color: mfLettersColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        _isLoading = true;
                        _isLoading = await Provider.of<Fundraisers>(context,
                                listen: false)
                            .payoutAndCloseFundraiser(fundData.id);
                        if (_isLoading) {
                          Navigator.pop(context);
                        }
                        // } else {
                        //   showCustomDialog2(context, fundData);
                        // }
                      },
                      style: ElevatedButton.styleFrom(
                        shadowColor: mfPrimaryColor.withOpacity(0.5),
                        fixedSize: Size(90, 35),
                        primary: mfPrimaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(9),
                        ),
                      ),
                      child: !_isLoading
                          ? Text(
                              'Proceed',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            )
                          : CircularProgressIndicator(),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        shadowColor: Colors.redAccent.withOpacity(0.5),
                        fixedSize: Size(90, 35),
                        primary: Colors.redAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(9),
                        ),
                      ),
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void showCustomDialog2(BuildContext context, FundraiserDetails fundData) {
    String selectedAccount;
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        contentPadding: EdgeInsets.zero,
        content: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: selectedAccount,
                  icon: const Icon(Icons.arrow_circle_down),
                  iconSize: 20,
                  elevation: 16,
                  underline: Container(),
                  onChanged: (String newValue) {
                    setState(() {
                      selectedAccount = newValue;
                      print(selectedAccount);
                    });
                  },
                  items: List.generate(fundData.location.bankAccounts.length,
                      (index) {
                    return DropdownMenuItem(
                      value: fundData.location.bankAccounts[index].bankName,
                      child: Text(
                        fundData.location.bankAccounts[index].bankName,
                      ),
                    );
                  }),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
