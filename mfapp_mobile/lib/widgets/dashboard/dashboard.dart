import 'package:flutter/material.dart';

import '../../widgets/dashboard/bars_widget.dart';
import '../../bin/colors.dart';
import '../../providers/fundraiser.dart';
import '../../widgets/dashboard/donations_chart.dart';

class DashboardWidget extends StatefulWidget {
  final data;
  final fundraisers;

  DashboardWidget(this.data, this.fundraisers);

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
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 20),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 4.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(11),
                  ),
                  color: mfLightGreen,
                ),
                child: FutureBuilder<List<Fundraiser>>(
                  future: widget.fundraisers,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Center(child: Text('CHART'));
                    } else if (snapshot.hasError) {
                      Center(child: Text('Something went wrong!'));
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
                //Tha mporouse na einai Total Donations,
                info: widget.data.totalCompletedFundraisers,
                color: mfLightBlueColor,
                secondColor: mfLightBlueColor,
                icon: Icons.share_outlined,
              ),
              BarsWidget(
                dashboardData: widget.data,
                text: 'Open Fundraisers',
                //Tha mporouse na einai Total Payouts
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
