import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:salesapp251/functions/methods.dart';

import '../../models/buildingModel.dart';

class Report extends StatefulWidget {
  const Report({super.key, required this.dropAppBar, required this.email});
  final String dropAppBar;
  final String email;

  @override
  State<Report> createState() => _ReportState();
}

// "Accepted", "Rejected", "Pending"

class _ReportState extends State<Report> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget.dropAppBar == "Pending"
          ? fetchPending(widget.email)
          : widget.dropAppBar == "Accepted"
              ? fetchAccepted(widget.email)
              : fetchRejected(widget.email),
      builder: ((context, AsyncSnapshot<List<Building>> snapshot) {
        switch(snapshot.connectionState){
          
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
            return Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Text(
                              "Building:",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18.0,
                              ),
                            ),
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
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Text(
                              "Location:",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18.0,
                              ),
                            ),
                            Text(
                              buildings[index].location,
                              style: const TextStyle(
                                fontSize: 18.0,
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
                            ? Icon(Icons.check)
                            : widget.dropAppBar == "Pending"
                                ? Icon(Icons.question_mark)
                                : Icon(Icons.close),
                      ],
                    ),
                  ],
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
