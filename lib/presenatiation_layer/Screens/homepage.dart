import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:salesapp251/functions/methods.dart';
import 'package:salesapp251/models/buildingModel.dart';
import 'package:fl_chart/fl_chart.dart';

import '../../Widgets/chart_container.dart';

class FrontPage extends StatefulWidget {
  const FrontPage({super.key, required this.email});
  final String email;

  @override
  State<FrontPage> createState() => _FrontPageState();
}

class _FrontPageState extends State<FrontPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * .4,
          child: FutureBuilder(
            future: fetchTask(widget.email),
            builder: ((BuildContext context,
                AsyncSnapshot<List<Building>> snapshot) {
              List<Building>? buildingList = snapshot.data;
              if (buildingList != null) {
                return ListView.builder(
                  itemCount: buildingList.length,
                  itemBuilder: ((context, index) {
                    return Container(
                      height: 200.0,
                      width: MediaQuery.of(context).size.width * .9,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                      child: Card(
                        child: Column(
                          children: [
                            Text(buildingList[index].blgName),
                            Text(buildingList[index].location),
                          ],
                        ),
                      ),
                    );
                  }),
                );
              }
              return const SizedBox.shrink();
            }),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 400,
            height: 400,
            child: ChartContainer(
                title: 'Bar Chart',
                color: Color(0xfffc5185),
                chart: BarChartContent()),
          ),
        )
      ],
    );
  }
}

class BarChartContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(),
    );
  }
}
