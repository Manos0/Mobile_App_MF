import 'package:flutter/material.dart';

import '../../widgets/dashboard/bars_widget.dart';
import '../../bin/colors.dart';
import '../../widgets/dashboard/bar_chart_widget.dart';
import '../../widgets/dashboard/line_chart_widget.dart';

class DashboardWidget extends StatefulWidget {
  final data;

  DashboardWidget(this.data);

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
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(11),
                  ),
                  color: mfLightGreen,
                ),
                child: LineChartWidget(widget.data.userFundraisers),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                padding: EdgeInsets.fromLTRB(10, 15, 10, 10),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(11),
                  ),
                  color: mfLightGreen,
                ),
                child: BarChartWidget(widget.data.userFundraisers),
                // child: FutureBuilder<List<Fundraiser>>(
                //   future: widget.fundraisers,
                //   builder: (context, snapshot) {
                //     if (snapshot.hasData) {
                //       return Center(child: Text('CHART'));
                //     } else if (snapshot.hasError) {
                //       Center(child: Text('Something went wrong!'));
                //     }
                //     return Scaffold(
                //       body: Center(
                //         child: CircularProgressIndicator(),
                //       ),
                //     );
                //   },
                // ),
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
