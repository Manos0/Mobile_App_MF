import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:readmore/readmore.dart';

import '../../../bin/colors.dart';

class Donations extends StatelessWidget {
  final data;
  Donations(this.data);

  @override
  Widget build(BuildContext context) {
    int i = 0;

    DateTime paymentDate =
        new DateFormat('yyyy-MM-dd').parse(data.payment[i].paymentPaymentDate);
    var payDate = DateFormat.MMMd().format(paymentDate);

    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(bottom: 30),
          child: Text(
            'Donations',
            style: TextStyle(
                color: mfLettersColor,
                fontSize: 16,
                fontWeight: FontWeight.w600),
          ),
        ),
        Container(
          child: Column(
            children: List.generate(
              data.payment.length,
              (index) {
                return Container(
                  margin: EdgeInsets.only(top: 8),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            if (data.payment[index].paymentAnonymous ||
                                data.payment[index].paymentHideName ||
                                data.payment[index].paymentFirstName == null ||
                                data.payment[index].paymentLastName == null)
                              Text(
                                'Anonymous',
                                style: TextStyle(
                                  color: mfLettersColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            else if (data.payment[index].paymentFirstName !=
                                    null &&
                                data.payment[index].paymentLastName != null)
                              Flexible(
                                child: Text(
                                  '${data.payment[index].paymentFirstName}' +
                                      ' ' +
                                      '${data.payment[index].paymentLastName}',
                                  style: TextStyle(
                                    color: mfLettersColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              )
                            else
                              Text(''),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 30),
                                  child: Text(
                                    data.payment[index].paymentHideContribution
                                        ? '(hidden)'
                                        : '\$${data.payment[index].paymentAmount.toStringAsFixed(0)}',
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Text(
                                  '${payDate}',
                                  style: TextStyle(
                                    color: mfLightGrey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Row(
                                children: [
                                  if (data.payment[index]
                                              .paymentTributeFirstName !=
                                          null ||
                                      data.payment[index]
                                              .paymentTributeLastName !=
                                          null)
                                    if (data.payment[index].paymentInMemoryOf)
                                      Text(
                                        'In memory of',
                                        style: TextStyle(
                                          color: mfLettersColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )
                                    else if (data
                                        .payment[index].paymentInHonorOf)
                                      Text(
                                        'In honor of',
                                        style: TextStyle(
                                          color: mfLettersColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                  if (data.payment[index].paymentInMemoryOf ||
                                      data.payment[index].paymentInHonorOf)
                                    Text(
                                      ' ' +
                                          '${data.payment[index].paymentTributeFirstName}' +
                                          ' ' +
                                          '${data.payment[index].paymentTributeLastName}',
                                      style: TextStyle(
                                        color: mfLettersColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: data.payment[index].paymentComment != null
                                  ? ReadMoreText(
                                      '${data.payment[index].paymentComment}',
                                      style: TextStyle(
                                        color: mfLettersColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      textAlign: TextAlign.left,
                                      trimCollapsedText: '  Show more',
                                      trimExpandedText: ' Show less',
                                      moreStyle: TextStyle(
                                          fontSize: 14, color: mfPrimaryColor),
                                      lessStyle: TextStyle(
                                          fontSize: 14, color: mfPrimaryColor),
                                      trimMode: TrimMode.Line,
                                      trimLines: 3,
                                      delimiter: '',
                                    )
                                  : Text(''),
                            ),
                            Divider(
                              thickness: 2,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
