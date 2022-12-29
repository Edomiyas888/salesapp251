import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:salesapp251/functions/methods.dart';
import 'package:salesapp251/models/buildingModel.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:salesapp251/presenatiation_layer/Screens/FormPage.dart';

class FrontPage extends StatefulWidget {
  const FrontPage({super.key});

  @override
  State<FrontPage> createState() => _FrontPageState();
}

class _FrontPageState extends State<FrontPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 12.0),
        const Expanded(
          child: Text(
            "Current Tasks",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black54,
              fontSize: 19.0,
            ),
          ),
        ),
        const SizedBox(height: 15.0),
        Expanded(
          flex: 9,
          child: FutureBuilder(
            future: fetchTask(),
            builder:
                ((BuildContext context, AsyncSnapshot<List<Building>> snapshot) {
              List<Building>? buildingList = snapshot.data;
              if (buildingList != null) {
                return ListView.builder(
                  itemCount: buildingList.length,
                  itemBuilder: ((context, index) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                              horizontal: 26.0, vertical: 6.0)
                          .copyWith(top: 24.0),
                      height: 110.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FormPage(
                                      assignedBld: buildingList[index],
                                      isPending: false)));
                        },
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 6.0, horizontal: 10.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Building:",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18.0,
                                      ),
                                    ),
                                    Text(
                                      buildingList[index].blgName,
                                      style: const TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 6.0),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Location:",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18.0,
                                      ),
                                    ),
                                    Text(
                                      buildingList[index].location,
                                      style: const TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
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
