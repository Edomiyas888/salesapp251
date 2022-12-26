import 'package:flutter/material.dart';
import 'package:salesapp251/Widgets/rejectedForm.dart';

import '../../Widgets/acceptedForm.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final TextEditingController bldNameCont = TextEditingController();
  final TextEditingController bldLocationCont = TextEditingController();
  Confirmation groupValue = Confirmation.accepted;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              const SizedBox(height:21.3),
              groupValue == Confirmation.accepted? const AcceptedForm():const RejectedForm(),
            ],
          ),
        ),
    );
  }
}

enum Confirmation {
  accepted,
  rejected,
}
