import 'package:flutter/material.dart';
import 'package:salesapp251/enums.dart';
import 'package:salesapp251/functions/methods.dart';
import 'package:salesapp251/models/buildingModel.dart';
import '../../Widgets/acceptedForm.dart';

class FormPage extends StatefulWidget {
  const FormPage(
      {super.key,
      required this.assignedBld,
      required this.isPending});
  final Building assignedBld;
  final bool isPending;

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

  void showSnackBar(BuildContext context, bool value) async {
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
      await deleteTask(widget.assignedBld.id!);
      bldNameCont.clear();
      bldLocationCont.clear();
      rejectedFormCont.clear();
      acceptedNameCont.clear();
      acceptedPhoneCont.clear();
      Navigator.pop(context);
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
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Space251"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * .04),
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
                    borderRadius: BorderRadius.circular(10.0),
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
                    borderRadius: BorderRadius.circular(10.0),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              "Reason:",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.5,
                                color: Colors.black54,
                              ),
                            ),
                            const SizedBox(width: 30.0),
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
                              items: list.map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                        dropdownValue == "Other"
                            ? TextFormField(
                                controller: rejectedFormCont,
                                maxLines: 5,
                                decoration: InputDecoration(
                                  fillColor: Colors.black45,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  hintText: "Enter reason here ...",
                                ),
                              )
                            : const SizedBox.shrink(),
                      ],
                    ),
              const SizedBox(height: 27.0),
              Padding(
                padding: const EdgeInsets.all(8.0)
                    .copyWith(left: size.width / 3 - 20),
                child: ElevatedButton(
                  onPressed: () async {
                    if (widget.isPending) {
                      bool result = await updatePending(
                        widget.assignedBld.id!,
                        acceptedNameCont.text,
                        acceptedPhoneCont.text,
                        dropdownValue == "Other"
                            ? rejectedFormCont.text
                            : dropdownValue,
                        groupValue == Confirmation.accepted
                            ? UploadType.accepted
                            : UploadType.rejected,
                      );
                      if (result) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              "Successfuly updated!",
                              style: TextStyle(color: Colors.green),
                            ),
                          ),
                        );
                        Navigator.pop(context);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              "Failed to submit. Please try again!",
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                        );
                      }
                    } else {
                      if (groupValue == Confirmation.accepted) {
                        bool value = await uploadAccepted(
                          blgName: bldNameCont.text,
                          blgLocation: bldLocationCont.text,
                          managerName: acceptedNameCont.text,
                          managerPhone: acceptedPhoneCont.text,
                        );
                        showSnackBar(context, value);
                      } else {
                        if (dropdownValue == "No manager") {
                          bool pendingValue = await uploadPending(
                            blgName: bldNameCont.text,
                            blgLocation: bldLocationCont.text,
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
                          );
                          showSnackBar(context, rejectedValue);
                        }
                      }
                    }
                  },
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                    child: Text(
                      widget.isPending ? "Update" : "Submit",
                      style: const TextStyle(fontSize: 18.0),
                    ),
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
