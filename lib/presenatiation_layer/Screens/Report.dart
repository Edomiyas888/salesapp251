import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:salesapp251/functions/methods.dart';
import 'package:salesapp251/presenatiation_layer/Screens/FormPage.dart';

import '../../models/buildingModel.dart';

class Report extends StatefulWidget {
  const Report({super.key, required this.dropAppBar});
  final String dropAppBar;

  @override
  State<Report> createState() => _ReportState();
}

// "Accepted", "Rejected", "Pending"

class _ReportState extends State<Report> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget.dropAppBar == "Pending"
          ? fetchPending()
          : widget.dropAppBar == "Accepted"
              ? fetchAccepted()
              : fetchRejected(),
      builder: ((context, AsyncSnapshot<List<Building>> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
          case ConnectionState.active:
            const Center(child: CircularProgressIndicator());
            break;
          case ConnectionState.done:
            List<Building> buildings = snapshot.data!;
            return ListView.builder(
              itemCount: buildings.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    if (widget.dropAppBar == "Pending") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FormPage(
                            assignedBld: buildings[index],
                            isPending: true,
                          ),
                        ),
                      );
                    }
                  },
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 30.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                  const SizedBox(width: 8.0),
                                  Text(
                                    buildings[index].blgName,
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
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  const SizedBox(width: 8.0),
                                  Text(
                                    buildings[index].location,
                                    style: const TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              widget.dropAppBar == "Accepted"
                                  ? Icon(Icons.check, color: Colors.green,)
                                  : widget.dropAppBar == "Pending"
                                      ? Icon(Icons.question_mark, color: Colors.yellow,)
                                      : Icon(Icons.close, color: Colors.red,),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
        }
        return const SizedBox.shrink();
      }),
    );
  }
}
