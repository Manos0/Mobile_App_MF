import 'package:flutter/material.dart';

import '../../widgets/dashboard/bars_widget.dart';
import '../../bin/colors.dart';
import '../../widgets/dashboard/bar_chart_widget.dart';
import '../../widgets/dashboard/line_chart_widget.dart';

class DashboardWidget extends StatefulWidget {
  final data;
  final Future<List<dynamic>> lineData;
  final Future<List<dynamic>> barData;

  DashboardWidget({this.data, this.lineData, this.barData});

  @override
  _DashboardWidgetState createState() => _DashboardWidgetState();
}

class _DashboardWidgetState extends State<DashboardWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 3,
                child: FutureBuilder<List<dynamic>>(
                  future: widget.lineData,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done &&
                        snapshot.hasData) {
                      return Container(
                        margin: EdgeInsets.only(bottom: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(11),
                          ),
                          color: mfLightlightGrey,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(15, 8, 8, 8),
                              child: Text(
                                'Monthly Total Fundraised',
                                style: TextStyle(
                                  color: mfSecondaryLetterColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height / 4.1,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 10),
                              child: LineChartWidget(snapshot.data),
                            )
                          ],
                        ),
                      );
                    } else if (snapshot.hasError) {
                      print('line chart error: ${snapshot}');
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Something went wrong!',
                              style: TextStyle(
                                color: mfLettersColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                    return Scaffold(
                      body: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  },
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 3,
                child: FutureBuilder<List<dynamic>>(
                  future: widget.barData,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done &&
                        snapshot.hasData) {
                      return Container(
                        margin: EdgeInsets.only(bottom: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(11),
                          ),
                          color: mfLightGreen,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(15, 8, 8, 8),
                              child: Text(
                                'Daily Donations',
                                style: TextStyle(
                                  color: mfSecondaryLetterColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height / 4.1,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 10),
                              child: BarChartWidget(snapshot.data),
                            )
                          ],
                        ),
                      );
                    } else if (snapshot.hasError) {
                      print('bar chart error: ${snapshot}');
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Something went wrong!',
                              style: TextStyle(
                                color: mfLettersColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                    return Scaffold(
                      body: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  },
                ),
              ),
              BarsWidget(
                dashboardData: widget.data,
                text: 'Total Fundraisers',
                info: widget.data.totalFundraisers,
                color: mfPrimaryColor,
                secondColor: mfPrimaryColor,
                icon: Icons.check_circle_outline_rounded,
              ),
              BarsWidget(
                dashboardData: widget.data,
                text: 'Completed Fundraisers',
                info: widget.data.totalCompletedFundraisers,
                color: mfLightBlueColor,
                secondColor: mfLightBlueColor,
                icon: Icons.share_outlined,
              ),
              BarsWidget(
                dashboardData: widget.data,
                text: 'Open Fundraisers',
                info: widget.data.totalOpenFundraisers,
                color: Colors.purple,
                secondColor: Colors.purpleAccent,
                icon: Icons.timelapse,
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// Container(
//                 margin: EdgeInsets.only(bottom: 20),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.all(
//                     Radius.circular(11),
//                   ),
//                   color: mfLightGreen,
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.fromLTRB(15, 8, 8, 8),
//                       child: Text(
//                         'Daily Donations',
//                         style: TextStyle(
//                           color: mfSecondaryLetterColor,
//                           fontSize: 14,
//                           fontWeight: FontWeight.w500,
//                         ),
//                         textAlign: TextAlign.left,
//                       ),
//                     ),
//                     Container(
//                       padding: EdgeInsets.fromLTRB(10, 15, 10, 10),
//                       width: MediaQuery.of(context).size.width,
//                       height: MediaQuery.of(context).size.height / 4,
//                       child: BarChartWidget(widget.data.userFundraisers),
//                     ),
//                   ],
//                 ),
//               ),