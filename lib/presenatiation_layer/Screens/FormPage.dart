import 'package:flutter/material.dart';
import 'package:salesapp251/Widgets/rejectedForm.dart';
import 'package:salesapp251/functions/methods.dart';
import 'package:salesapp251/models/buildingModel.dart';

import '../../Widgets/acceptedForm.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key, this.email, required this.assignedBld});
  final String? email;
  final Building assignedBld;

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final TextEditingController bldNameCont = TextEditingController();
  final TextEditingController bldLocationCont = TextEditingController();
  final TextEditingController rejectedFormCont = TextEditingController();
  final TextEditingController acceptedNameCont = TextEditingController();
  final TextEditingController acceptedPhoneCont = TextEditingController();
  Confirmation groupValue = Confirmation.accepted;
  List<String> list = ["No Budget", "No manager", "Existing Sytem", "Other"];
  String dropdownValue = "No Budget";

  void showSnackBar(BuildContext context, bool value) async{
    if (!value) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Failed to submit. Please try again!",
            style: TextStyle(color: Colors.red),
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Successfuly submited!",
            style: TextStyle(color: Colors.green),
          ),
        ),
      );
      await deleteTask(widget.email!, widget.assignedBld.id!);
      bldNameCont.clear();
      bldLocationCont.clear();
      rejectedFormCont.clear();
      acceptedNameCont.clear();
      acceptedPhoneCont.clear();
    }
  }
  @override
  void initState() {
    super.initState();
    bldNameCont.text = widget.assignedBld.blgName;
    bldLocationCont.text = widget.assignedBld.location;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 22.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 27.0),
              const Text(
                "Building Name:",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.5,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 13.5),
              TextField(
                controller: bldNameCont,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                  hintText: "Building's name here...",
                ),
              ),
              const SizedBox(height: 27.0),
              const Text(
                "Building Address:",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.5,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 13.5),
              TextField(
                controller: bldLocationCont,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                  hintText: "Address here...",
                ),
              ),
              const SizedBox(height: 13.5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      const Text("Accepted "),
                      Radio(
                        value: Confirmation.accepted,
                        groupValue: groupValue,
                        onChanged: (Confirmation? value) {
                          groupValue = value!;
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                  const SizedBox(width: 30.0),
                  Row(
                    children: [
                      const Text('Rejected '),
                      Radio(
                        value: Confirmation.rejected,
                        groupValue: groupValue,
                        onChanged: (Confirmation? value) {
                          groupValue = value!;
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 27.0),
              groupValue == Confirmation.accepted
                  ? AcceptedForm(
                      nameCont: acceptedNameCont,
                      phoneCont: acceptedPhoneCont,
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DropdownButton<String>(
                          value: dropdownValue,
                          icon: const Icon(Icons.arrow_downward_sharp),
                          elevation: 16,
                          onChanged: (String? value) {
                            // This is called when the user selects an item.
                            setState(() {
                              dropdownValue = value!;
                            });
                          },
                          items:
                              list.map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                        dropdownValue == "Other"
                            ? TextFormField(
                                controller: rejectedFormCont,
                                maxLines: 5,
                                decoration: InputDecoration(
                                  fillColor: Colors.black45,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(40.0),
                                  ),
                                  hintText: "Enter reason here ...",
                                ),
                              )
                            : const SizedBox.shrink(),
                      ],
                    ),
              const SizedBox(height: 27.0),
              ElevatedButton(
                onPressed: () async {
                  if (groupValue == Confirmation.accepted) {
                    bool value = await uploadAccepted(
                      blgName: bldNameCont.text,
                      blgLocation: bldLocationCont.text,
                      managerName: acceptedNameCont.text,
                      managerPhone: acceptedPhoneCont.text,
                      empMail: widget.email!,
                    );
                    showSnackBar(context, value);
                  } else {
                    if (dropdownValue == "No manager") {
                      bool pendingValue = await uploadPending(
                        blgName: bldNameCont.text,
                        blgLocation: bldLocationCont.text,
                        empMail: widget.email!,
                        managerName: acceptedNameCont.text,
                        managerPhone: acceptedPhoneCont.text,
                      );
                      showSnackBar(context, pendingValue);
                    } else {
                      bool rejectedValue = await uploadRejected(
                        blgName: bldNameCont.text,
                        blgLocation: bldLocationCont.text,
                        reason: dropdownValue == "Other"
                            ? rejectedFormCont.text
                            : dropdownValue,
                        empMail: widget.email!,
                      );
                      showSnackBar(context, rejectedValue);
                    }
                  }
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                  child: Text(
                    "Submit",
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum Confirmation {
  accepted,
  rejected,
}
